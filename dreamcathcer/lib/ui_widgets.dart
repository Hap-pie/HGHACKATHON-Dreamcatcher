import 'package:dreamcathcer/design_elements.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Card/Transciption widget

Widget beautifyButton() {
  return Row(
    children: [
      Flexible(child: Container()),
      Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton.icon(
          icon: Icon(Icons.generating_tokens, color: const Color(0xff1B1414)),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xffAD9692),
          ),
          onPressed: () async => {
            // Gemini AI Function here
          },
          label: Text(
            'Beautify',
            style: GoogleFonts.urbanist(
                letterSpacing: 1,
                fontWeight: FontWeight.bold,
                color: const Color(0xff1B1414)),
          ),
        ),
      ),
    ],
  );
}
