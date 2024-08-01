import 'package:flutter/material.dart';
import 'package:medx/screens/Medical/medical_main_screen.dart';
import 'package:medx/screens/Onboarding.dart';
import 'package:medx/screens/Personal/personal_main_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  bool? isMedicalLogin;
  bool? isPersonalLogin;
  Future<void>? setLoggedInFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      setLoggedInFuture = checkLoginStatus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: setLoggedInFuture,
      builder: (context, snapshot) {
        if (isMedicalLogin == null || isPersonalLogin == null) {
          return Container(
              color: Colors.white,
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              child: Center(
                  child:
                      CircularProgressIndicator())); // Show a loading indicator while checking login status
        }
        if (isMedicalLogin == true) {
          return MedicalMainScreen();
        } else if (isPersonalLogin == true) {
          return PersonalMainScreen();
        } else
          return OnboardingScreen();
      },
    );
  }

  Future<void> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('isMedicalLogin') == null &&
        prefs.getBool('isPersonalLogin') == null) {
      await prefs.setBool('isMedicalLogin', false);
      await prefs.setBool('isPersonalLogin', false);
    }
    setState(() {
      isPersonalLogin = prefs.getBool('isPersonalLogin') ?? false;
      isMedicalLogin = prefs.getBool('isMedicalLogin') ?? false;
    });
  }
}
