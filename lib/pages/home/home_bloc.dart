import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:investment/models/app_user.dart';
import 'package:investment/pages/login/login_page.dart';
import 'package:investment/repositories/user_repository.dart';
import 'package:investment/utils/utils.dart';

class HomeBloc {
  AppUser? appUser;
  UserRepository userRepository = UserRepository();

  Map<String, String> activeIcons() {
    return {
      "PETR4": "assets/images/petrobras.png",
      "VALE3": "assets/images/vale.png",
      "MGLU3": "assets/images/magalu.png",
      "BCSA34": "assets/images/santander.png"
    };
  }

  Future<bool> getData() async {
    var result = await userRepository.getUser();

    if (result != null) {
      appUser = result;
      return true;
    }

    return false;
  }

  void logout(BuildContext context) {
    Utils.logout();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  List<Widget> getActives() {
    return appUser!.actives
        .map((e) => Container(
              width: 80,
              height: 100,
              padding: const EdgeInsets.all(15),
              margin:
                  const EdgeInsets.only(top: 10, left: 1, right: 10, bottom: 1),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    activeIcons()
                        .entries
                        .firstWhere(
                            (element) => element.key == e.active.activeType)
                        .value,
                    width: 30,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: Text(
                      Utils.formatExibitionAmount(e.active.amount),
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: Text(
                      "Qt:${e.quantity}",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),
            ))
        .toList();
  }
}
