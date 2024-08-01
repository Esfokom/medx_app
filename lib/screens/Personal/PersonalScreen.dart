import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../user_controls/user_controls.dart';

class PersonalScreen extends StatelessWidget {
  const PersonalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: Column(
            children: [
              Expanded(
                flex: 6,
                child: Center(
                  child: Image.asset(
                    "assets/images/MedX logo.png",
                    height: 300,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  "Personal",
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
                    Navigator.pushNamed(context, "personal/login");
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
                  onTap: () {
                    Navigator.pushNamed(context, "personal/signup");
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
      ),
    );
  }
}
