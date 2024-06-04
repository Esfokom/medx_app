import 'package:flutter/material.dart';
import 'package:medx/ThemeDictionary.dart';

class MedicalMainScreen extends StatelessWidget {
  const MedicalMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
          leading: Container(
            color: Colors.white,
            child: Image.asset("assets/images/MedX logo.png"),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.chat_outlined)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, "profile_screen_med");
                },
                icon: const Icon(Icons.person)),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "id_search");
                },
                style: ThemeDictionary.grayButtonStyle,
                child: const Text(
                  "Patient Database",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 20),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "personal_patients");
                },
                style: ThemeDictionary.grayButtonStyle,
                child: const Text(
                  "Personal Patients",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 20),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "requests");
                },
                style: ThemeDictionary.grayButtonStyle,
                child: const Text(
                  "Requests",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 20),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "new_record");
                },
                style: ThemeDictionary.grayButtonStyle,
                child: const Text(
                  "New Record",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
