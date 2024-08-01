import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonalMessaging extends StatelessWidget {
  const PersonalMessaging({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Text(
            "New to this space?",
            style: GoogleFonts.poppins(fontSize: 30),
          ),
          Divider(
            color: Colors.grey,
            indent: 20,
            endIndent: 20,
            thickness: 0.8,
          ),
          const SizedBox(
            height: 50,
          ),
          Icon(
            Icons.message_rounded,
            color: Colors.red.shade400,
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () {},
            child: Text("Start a new conversation"),
          )
        ],
      ),
    );
  }
}
