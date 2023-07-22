import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Credits extends StatelessWidget {
  const Credits({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Made with ❤️",
          style:
              GoogleFonts.fasthand(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        Text(
          "-Chinmay Khanzode",
          style: GoogleFonts.dancingScript(fontSize: 20),
        )
      ]),
    );
  }
}
