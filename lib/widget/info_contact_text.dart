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
        child: Column(
          children: [
            if (variable.isNotEmpty)
              Text(
                textAlign: TextAlign.left,
                '$txt : $variable',
                style: GoogleFonts.alexandria(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )
            else
              Text(
                textAlign: TextAlign.left,
                '$txt : None',
                style: GoogleFonts.alexandria(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
