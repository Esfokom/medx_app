import 'package:flutter/material.dart';
import 'package:medx/user_controls/LoremIpsumWIthHeader.dart';
import 'package:medx/user_controls/user_controls.dart';

class MedicalData extends StatelessWidget {
  const MedicalData({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.red,
          title: Center(
            child: Text("Medical Data"),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              LoremIpsumWithHeader(header: "Immunization"),
              SizedBox(
                height: 20,
              ),
              LoremIpsumWithHeader(header: "Allergies"),
              SizedBox(
                height: 20,
              ),
              LoremIpsumWithHeader(header: "Blood Type"),
              SizedBox(
                height: 20,
              ),
              LoremIpsumWithHeader(header: "Insurance"),
              SizedBox(
                height: 20,
              ),
              LoremIpsumWithHeader(header: "Illnesses"),
              SizedBox(
                height: 20,
              ),
              LoremIpsumWithHeader(header: "Hospital IDs")
            ],
          ),
        ),
      ),
    );
  }
}
