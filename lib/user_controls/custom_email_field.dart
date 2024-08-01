import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomEmailField extends StatelessWidget {
  const CustomEmailField({
    super.key,
    required this.fieldText,
    required this.hintText,
    required this.textEditingController,
    required this.preText,
    this.onChanged,
    this.textInputType,
    this.focusable,
  });

  final String hintText;
  final String fieldText;
  final TextEditingController textEditingController;
  final Function(String text)? onChanged;
  final bool? focusable;
  final String preText;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(preText),
        const SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                  color: isEmailValid(textEditingController.text)
                      ? Colors.green
                      : Colors.red,
                  width: 1)),
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

  bool isEmailValid(String email) {
    // Regular expression to match email format
    RegExp emailRegex = RegExp(
        r"^[a-zA-Z0-9.!#$%&\'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$");

    // Check if the email matches the regular expression
    return emailRegex.hasMatch(email);
  }
}
