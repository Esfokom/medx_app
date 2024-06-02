import 'package:flutter/material.dart';

class Mainscreen extends StatelessWidget {
  const Mainscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: Image.asset("assets/images/MedX logo.png"),
          actions: [
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
              SizedBox(
                height: 20,
              ),
              Image.asset(
                "assets/images/Drawkit-Vector-Illustration-Medical-06.png",
                height: 300,
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black12,
                  minimumSize: const Size(250, 50),
                ),
                child: const Text(
                  "Drug Record",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Image.asset(
                "assets/images/Drawkit-Vector-Illustration-Medical-17.png",
                height: 400,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black12,
                  minimumSize: const Size(250, 50),
                ),
                child: const Text(
                  "Medical Record",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
