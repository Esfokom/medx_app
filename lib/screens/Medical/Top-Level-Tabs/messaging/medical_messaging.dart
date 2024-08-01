import 'package:flutter/material.dart';

class MedicalMessaging extends StatefulWidget {
  const MedicalMessaging({super.key});

  @override
  State<MedicalMessaging> createState() => _MedicalMessagingState();
}

class _MedicalMessagingState extends State<MedicalMessaging> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Messaging"),
    );
  }
}
