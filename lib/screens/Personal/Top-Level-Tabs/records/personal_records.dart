import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonalRecords extends StatelessWidget {
  const PersonalRecords({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                color: Colors.red.shade200,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          child: Icon(Icons.person_2_outlined),
                          radius: 25,
                          backgroundColor: Colors.white70,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Hello, Ivan 👋",
                          style: GoogleFonts.poppins(
                              color: Colors.white, fontSize: 20),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Divider(
            color: Colors.grey,
            thickness: 1.5,
            indent: 20,
            endIndent: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.red.shade200,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Records",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "You have no records yet",
                        style: GoogleFonts.poppins(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void hey() {}
}
