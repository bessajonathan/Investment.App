import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Popup {
  showWait(dynamic context, {String mensagem = "Aguarde..."}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
          child: AlertDialog(
            title: Text(
              mensagem,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  fontSize: 14, fontWeight: FontWeight.normal),
            ),
            content: SizedBox(
              height: 120,
              width: 120,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        );
      },
    );
  }

  closeWait(BuildContext dialogContext) {
    Navigator.pop(dialogContext);
  }
}
