import 'package:flutter/material.dart';

class PersonalMainScreen extends StatelessWidget {
  const PersonalMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: Image.asset("assets/images/MedX logo.png"),
          actions: const [
            Icon(Icons.settings),
            SizedBox(
              width: 20,
            ),
            Icon(Icons.person),
            SizedBox(
              width: 20,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Image.asset(
                "assets/images/Drawkit-Vector-Illustration-Medical-06.png",
                height: 300,
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "drug_record");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black12,
                  minimumSize: const Size(250, 50),
                ),
                child: const Text(
                  "Drug Record",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Image.asset(
                "assets/images/Drawkit-Vector-Illustration-Medical-17.png",
                height: 400,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "medical_record");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black12,
                  minimumSize: const Size(250, 50),
                ),
                child: const Text(
                  "Medical Record",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
