import 'package:flutter/material.dart';
import 'package:medx/user_controls/PatientRequestWidget.dart';
import 'package:medx/user_controls/user_controls.dart';

class PatientRequest extends StatelessWidget {
  const PatientRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Center(child: const Text("Patient Request")),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Patientrequestwidget(),
            Patientrequestwidget(),
            Patientrequestwidget(),
            Patientrequestwidget(),
            Patientrequestwidget()
          ],
        ),
      ),
    );
  }
}
