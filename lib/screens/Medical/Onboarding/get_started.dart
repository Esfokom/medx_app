import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medx/screens/Medical/Onboarding/personal_details.dart';
import 'package:medx/user_controls/user_controls.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SvgPicture.asset(
                  "assets/svg/personal details.svg",
                  height: 150,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Image.asset(
                "assets/images/MedX logo.png",
                width: 120,
                height: 120,
              ),
              NextButton(
                  formValid: true,
                  text: "Get Started",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PersonalDetails(),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    ));
  }
}
