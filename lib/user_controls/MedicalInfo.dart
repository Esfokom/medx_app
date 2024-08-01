import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medx/ThemeDictionary.dart';

class Medicalinfo extends StatelessWidget {
  final String fieldKey;
  final String fieldValue;
  const Medicalinfo(
      {super.key, required this.fieldKey, required this.fieldValue});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              "$fieldKey:",
              style: cardFieldTextStyle,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 8,
            child: Text(fieldValue,
                overflow: TextOverflow.ellipsis, style: cardDetailTextStyle),
          )
        ],
      ),
    );
  }

  static TextStyle cardFieldTextStyle =
      GoogleFonts.poppins(fontWeight: FontWeight.w500);
  static TextStyle cardDetailTextStyle =
      GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600);
  static BoxDecoration cardDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
            color: Colors.black54,
            blurStyle: BlurStyle.normal,
            blurRadius: 10,
            offset: Offset(0, 3),
            spreadRadius: 0)
      ],
      gradient: LinearGradient(
          colors: [Colors.grey.shade50, Colors.grey.shade300],
          begin: Alignment.topCenter));
}
