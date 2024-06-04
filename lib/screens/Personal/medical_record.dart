import 'package:flutter/material.dart';
import 'package:medx/user_controls/user_controls.dart';

class MedicalRecord extends StatelessWidget {
  const MedicalRecord({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        title: Center(
          child: Text("Medical Record"),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Patientrequestwidget(),
            Patientrecordwidget(),
            Patientrequestwidget(),
            Patientrecordwidget(),
            Patientrequestwidget(),
            Patientrecordwidget(),
          ],
        ),
      ),
    ));
  }
}
