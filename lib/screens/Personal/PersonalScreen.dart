import 'package:flutter/material.dart';

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
        body: Column(
          children: [
            Expanded(
              flex: 6,
              child: Image.asset("assets/images/MedX logo.png"),
            ),
            const Expanded(
              child: Text(
                "Personal",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Expanded(
                child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "personal_login");
              },
              child: const Text(
                "Log In",
                style: TextStyle(fontSize: 20),
              ),
            )),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "personal_signup");
                },
                child: const Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 20),
                ),
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
