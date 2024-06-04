import 'package:flutter/material.dart';
import 'package:medx/user_controls/user_controls.dart';

class DrugRecord extends StatelessWidget {
  const DrugRecord({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          title: Center(
            child: Text("Drug Record"),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Patientrecordwidget(),
              Patientrecordwidget(),
              Patientrecordwidget(),
              Patientrecordwidget(),
              Patientrecordwidget(),
            ],
          ),
        ),
      ),
    );
  }
}
