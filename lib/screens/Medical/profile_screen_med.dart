import 'package:flutter/material.dart';
import 'package:medx/ThemeDictionary.dart';
import 'package:medx/screens/Onboarding.dart';
import 'package:medx/user_controls/next_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreenMed extends StatelessWidget {
  const ProfileScreenMed({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              CircleAvatar(
                radius: 150,
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Stephanie Ama Dede",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30)),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          "Hospital: ",
                          style: ThemeDictionary.grayText,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Ridge Experimental Hospital",
                          style: ThemeDictionary.blackText,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          "Speciality: ",
                          style: ThemeDictionary.grayText,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Cardiology",
                          style: ThemeDictionary.blackText,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          "Email: ",
                          style: ThemeDictionary.grayText,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "stephamadede@gmail.com",
                          style: ThemeDictionary.blackText,
                        ),
                      ],
                    ),
                    NextButton(
                      formValid: true,
                      text: "Logout",
                      onTap: () async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.setBool("isMedicalLogin", false);
                        prefs.setBool("isPersonalLogin", false);
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OnboardingScreen(),
                            ),
                            (route) => false);
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
