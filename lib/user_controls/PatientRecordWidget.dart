import 'package:flutter/material.dart';
import 'package:medx/user_controls/user_controls.dart';

class Patientrecordwidget extends StatelessWidget {
  const Patientrecordwidget({super.key});

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
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam hendrerit"
                " quis purus non efficitur. Suspendisse potenti. Donec quis tellus posuere "
                "diam ultrices congue. Nunc quam tortor, tincidunt in erat sed, posuere "
                "molestie tellus.",
                softWrap: true,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Learn More"),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
