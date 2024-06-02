import 'package:flutter/material.dart';

class MedicalLogin extends StatelessWidget {
  const MedicalLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hospital ID",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField()
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Medical Personnel ID",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField()
              ],
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, "medical_main_screen");
              },
              child: const Text(
                "Log In",
                style: TextStyle(fontSize: 20),
              )),
          const SizedBox(
            height: 150,
          )
        ],
      ),
    );
  }
}
