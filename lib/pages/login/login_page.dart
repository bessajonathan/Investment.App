import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:investment/pages/login/login_bloc.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc? bloc;

  @override
  initState() {
    bloc = LoginBloc();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                  top: 50, bottom: 20, left: 16, right: 16),
              child: Image.asset(
                'assets/images/login.jpg',
                width: 400,
              ),
            ),
            Text(
              "Seu dinheiro rendendo mais",
              style: GoogleFonts.poppins(
                textStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 80, left: 16, right: 16),
              color: Colors.blue.shade300,
              child: TextButton(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/google.png',
                      width: 32,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Entrar com o Google',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    )
                  ],
                ),
                onPressed: () async {
                  await bloc?.googleLogin(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
