import 'package:flutter/material.dart';
import 'package:medx/user_controls/user_controls.dart';

class PersonalPatients extends StatelessWidget {
  const PersonalPatients({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        title: const Center(
          child: Text("Personal Patients"),
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Patientrecordwidget(),
            Patientrecordwidget(),
            Patientrecordwidget(),
            Patientrecordwidget()
          ],
        ),
      ),
    );
  }
}
