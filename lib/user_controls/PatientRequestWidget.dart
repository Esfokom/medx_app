import 'package:flutter/material.dart';
import 'package:medx/user_controls/user_controls.dart';

class Patientrequestwidget extends StatelessWidget {
  const Patientrequestwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 8.0, // Blur amount
              offset: Offset(0, 3.0),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Medicalinfo(fieldKey: "Date", fieldValue: "2nd April 2024"),
            Medicalinfo(fieldKey: "Hospital", fieldValue: "Lorem Ipsum"),
            Medicalinfo(fieldKey: "Doctor ID", fieldValue: "123456"),
            Medicalinfo(fieldKey: "Patient ID", fieldValue: "123456"),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
