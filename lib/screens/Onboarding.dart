import 'package:flutter/material.dart';

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
              child: Image.asset("assets/images/MedX logo.png"),
            ),
            Expanded(
              child: InkWell(
                onTap: () {},
                child: Container(
                  color: Colors.red,
                  width: double.infinity,
                  child: const Center(
                      child: Text(
                    "Personal",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 30),
                  )),
                ),
              ),
            ),
            Expanded(
                child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, "medical");
              },
              child: Container(
                color: Colors.black,
                width: double.infinity,
                child: const Center(
                    child: Text(
                  "Medical",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 30),
                )),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
