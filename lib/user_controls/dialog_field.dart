import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DialogField extends StatelessWidget {
  DialogField(
      {super.key,
      this.onTap,
      required this.textEditingController,
      required this.icon,
      required this.fieldText,
      required this.hintText});

  final Function()? onTap;
  final TextEditingController textEditingController;
  final Icon icon;
  final String fieldText;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
                decoration: InputDecoration(
                    filled: false,
                    border: InputBorder.none,
                    hintText: hintText,
                    icon: icon),
                canRequestFocus: false,
                onTap: onTap,
                controller: textEditingController),
          ))
        ],
      ),
    );
  }
}

String formatDate(DateTime date) {
  // Get the day of the month
  int day = date.day;

  // Determine the appropriate suffix for the day
  String suffix = _getDaySuffix(day);
  // Parse the input date in the format "1-12-2005"
  String formattedDate =
      DateFormat('EEEE, d\'$suffix\' MMMM yyyy').format(date);
  // Format the date using intl package
  return formattedDate;
}

String _getDaySuffix(int day) {
  if (day >= 11 && day <= 13) {
    return 'th';
  }

  switch (day % 10) {
    case 1:
      return 'st';
    case 2:
      return 'nd';
    case 3:
      return 'rd';
    default:
      return 'th';
  }
}
