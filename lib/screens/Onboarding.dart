import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../user_controls/next_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
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
                "Onboarding",
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
                onTap: () {
                  Navigator.pushNamed(context, "personal");
                },
                text: "Personal",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 40, left: 40),
              child: NextButton(
                color: Colors.black,
                formValid: true,
                onTap: () {
                  Navigator.pushNamed(context, "medical");
                },
                text: "Medical",
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
