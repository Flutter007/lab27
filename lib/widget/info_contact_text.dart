import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoContactText extends StatelessWidget {
  final String txt;
  final String variable;
  const InfoContactText({super.key, required this.txt, required this.variable});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Expanded(
        child: Text(
          textAlign: TextAlign.left,
          '$txt : $variable',
          style: GoogleFonts.alexandria(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
