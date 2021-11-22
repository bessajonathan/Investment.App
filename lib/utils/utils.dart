import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import "package:intl/intl.dart";

class Utils {
  static final FirebaseAuth auth = FirebaseAuth.instance;
  static GoogleSignInAccount? loggedUser;
  static String apiUrl = "https://10.0.2.2:5001/";
  static String apiKey =
      "bWVsaG9yU2lzdGVtYUZlaXRvUG9yTm9zQXRlT01vbWVudG9KSjEyMzQyNDNhc2Rhc2RhczI=";
  static IdTokenResult? idToken;

  static void setLoggedUser(
      GoogleSignInAccount user, IdTokenResult tokenResult) {
    loggedUser = user;
    idToken = tokenResult;
  }

  static void logout() {
    auth.signOut();
    loggedUser = null;
    idToken = null;
  }

  static String formatExibitionAmount(double amount) {
    final formatter = NumberFormat("#,##0.00", "pt_BR");
    String newText = "R\$ " + formatter.format(amount);
    return newText;
  }
}
