import 'package:flutter/material.dart';
import 'package:medx/user_controls/user_controls.dart';

class PatientRecord extends StatelessWidget {
  const PatientRecord({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          title: Center(child: const Text("Patient Record")),
        ),
        body: const SingleChildScrollView(
          child: Column(
            children: [
              Patientrecordwidget(),
              Patientrecordwidget(),
              Patientrecordwidget(),
              Patientrecordwidget(),
            ],
          ),
        ));
  }
}
