import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medx/user_controls/next_button.dart';

class MedicalScreen extends StatelessWidget {
  const MedicalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
        body: Column(
          children: [
            Expanded(
              flex: 6,
              child: Center(
                  child: Image.asset(
                "assets/images/MedX logo.png",
                height: 300,
              )),
            ),
            Expanded(
              child: Text(
                "Medical",
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 40, left: 40),
              child: NextButton(
                formValid: true,
                color: Colors.black,
                onTap: () {
                  Navigator.pushNamed(context, "medical/login");
                },
                text: "Log In",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 40, left: 40),
              child: NextButton(
                formValid: true,
                color: Colors.black,
                onTap: () {
                  Navigator.pushNamed(context, "medical/signup");
                },
                text: "Sign Up",
              ),
            ),
            const Expanded(
              flex: 2,
              child: SizedBox(),
            )
          ],
        ),
      ),
    );
  }
}
