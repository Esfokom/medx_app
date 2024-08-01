import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonalNotifications extends StatelessWidget {
  const PersonalNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "No notifications yet",
              style: GoogleFonts.poppins(fontSize: 30),
            ),
          ),
        ],
      ),
    );
  }
}
