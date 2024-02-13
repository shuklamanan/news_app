import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Texting extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  const Texting(
      {super.key, required this.text, required this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(color: color, fontSize: size),
    );
  }
}

class boldtext extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  const boldtext(
      {super.key, required this.text, required this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(
          color: color, fontSize: size, fontWeight: FontWeight.bold),
    );
  }
}
