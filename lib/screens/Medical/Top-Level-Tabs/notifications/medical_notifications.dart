import 'package:flutter/material.dart';

class MedicalNotifications extends StatefulWidget {
  const MedicalNotifications({super.key});

  @override
  State<MedicalNotifications> createState() => _MedicalNotificationsState();
}

class _MedicalNotificationsState extends State<MedicalNotifications> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text("Medical Notifications"),
      ),
    );
  }
}
