import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:investment/models/create_user.dart';
import 'package:investment/pages/home/home_page.dart';
import 'package:investment/repositories/user_repository.dart';
import 'package:investment/utils/popup.dart';
import 'package:investment/utils/utils.dart';

class LoginBloc {
  final popup = Popup();
  final userRepository = UserRepository();
  final googleSignIn = GoogleSignIn();

  Future googleLogin(BuildContext context) async {
    popup.showWait(context);
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      var authResult = await Utils.auth!.signInWithCredential(credential);

      var resultToken = await authResult.user!.getIdTokenResult();

      Utils.setLoggedUser(googleUser, resultToken);

      var result = await userRepository.registerUser(CreateUser(
          name: googleUser.displayName!, firebaseId: authResult.user!.uid));

      popup.closeWait(context);
      if (result != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } else {
        print("Erro durante registro do usuário");
      }
    } catch (error) {
      popup.closeWait(context);
      print('Erro durante login');
    }
  }
}
