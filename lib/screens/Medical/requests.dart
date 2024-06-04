import 'package:flutter/material.dart';
import 'package:medx/user_controls/PatientRequestWidget.dart';
import 'package:medx/user_controls/user_controls.dart';

class Requests extends StatelessWidget {
  const Requests({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Center(
          child: Text("Requests"),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Patientrequestwidget(),
            Patientrequestwidget(),
            Patientrequestwidget(),
            Patientrequestwidget(),
            Patientrequestwidget(),
            Patientrequestwidget(),
          ],
        ),
      ),
    );
  }
}
