import 'package:flutter/material.dart';
import 'package:medx/screens/Medical/medical_screens.dart';
import 'package:medx/screens/Medical/new_record.dart';

class MedicalRecords extends StatefulWidget {
  const MedicalRecords({super.key});

  @override
  State<MedicalRecords> createState() => _MedicalRecordsState();
}

class _MedicalRecordsState extends State<MedicalRecords> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.redAccent,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewRecord(),
                ));
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: Center(
          child: Records(),
        ));
  }
}
