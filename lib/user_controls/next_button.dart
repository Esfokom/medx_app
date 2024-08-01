import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NextButton extends StatelessWidget {
  const NextButton(
      {super.key,
      required this.formValid,
      required this.onTap,
      this.text,
      this.color});

  final bool formValid;
  final Function() onTap;
  final String? text;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80,
        width: double.infinity,
        decoration: BoxDecoration(
          color: formValid ? (color ?? Colors.red) : Colors.red.shade200,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            text ?? "Next",
            style: GoogleFonts.poppins(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
