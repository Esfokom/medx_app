import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomFieldWithPretext extends StatelessWidget {
  const CustomFieldWithPretext(
      {super.key,
      required this.fieldText,
      required this.hintText,
      required this.textEditingController,
      required this.preText,
      this.onChanged,
      this.textInputType,
      this.focusable,
      this.obscureText});

  final String hintText;
  final String fieldText;
  final TextEditingController textEditingController;
  final Function(String text)? onChanged;
  final bool? focusable;
  final bool? obscureText;
  final String preText;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(preText),
        SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.black, width: 1)),
          height: 80,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    fieldText,
                    style: GoogleFonts.poppins(color: Colors.redAccent),
                  ),
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(bottom: 8, left: 6, right: 2),
                child: TextField(
                  obscureText: obscureText ?? false,
                  canRequestFocus: focusable == null ? true : focusable!,
                  onChanged: onChanged,
                  keyboardType: textInputType ?? TextInputType.text,
                  controller: textEditingController ?? TextEditingController(),
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                  decoration: InputDecoration(
                    filled: false,
                    border: InputBorder.none,
                    hintText: hintText,
                  ),
                ),
              ))
            ],
          ),
        ),
      ],
    );
  }
}
