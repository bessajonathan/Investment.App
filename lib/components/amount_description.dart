import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:investment/utils/utils.dart';

class AmountDescription extends StatelessWidget {
  final double amount;
  final String description;

  const AmountDescription({
    required this.amount,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          padding: EdgeInsets.only(left: 20, top: 20, right: 20),
          child: Text(
            description,
            style: GoogleFonts.poppins(
              textStyle:
                  const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Text(
            Utils.formatExibitionAmount(amount),
            style: GoogleFonts.poppins(
              textStyle:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ],
    );
  }
}
