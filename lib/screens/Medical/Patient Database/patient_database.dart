import 'package:flutter/material.dart';
import 'package:medx/ThemeDictionary.dart';

class PatientDatabase extends StatelessWidget {
  const PatientDatabase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Patient Database")),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Center(
            child: CircleAvatar(
              radius: 150,
              child: Icon(
                Icons.person,
                size: 200,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ThemeDictionary.grayButtonStyle,
            onPressed: () {
              Navigator.pushNamed(context, "medical_patient_profile");
            },
            child: const Text(
              "Patient Profile",
              style: ThemeDictionary.blackText,
            ),
          ),
          ElevatedButton(
            style: ThemeDictionary.grayButtonStyle,
            onPressed: () {
              Navigator.pushNamed(context, "patient_record");
            },
            child: const Text(
              "Access Patient Record",
              style: ThemeDictionary.blackText,
            ),
          ),
          ElevatedButton(
            style: ThemeDictionary.grayButtonStyle,
            onPressed: () {
              Navigator.pushNamed(context, "patient_request");
            },
            child: const Text(
              "Requests",
              style: ThemeDictionary.blackText,
            ),
          )
        ],
      ),
    );
  }
}
