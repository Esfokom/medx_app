import 'package:flutter/material.dart';
import 'package:medx/user_controls/LoremIpsumWIthHeader.dart';
import 'package:medx/user_controls/user_controls.dart';

class NewRecord extends StatelessWidget {
  const NewRecord({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Center(
          child: Text("New Record"),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Medicalinfo(fieldKey: "Date", fieldValue: "12th April 2024"),
              SizedBox(
                height: 20,
              ),
              LoremIpsumWithHeader(header: "Symptoms"),
              SizedBox(
                height: 20,
              ),
              LoremIpsumWithHeader(header: "Tests Done"),
              SizedBox(
                height: 20,
              ),
              LoremIpsumWithHeader(header: "Medication"),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
