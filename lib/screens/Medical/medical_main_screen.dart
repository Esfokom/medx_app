import 'package:flutter/material.dart';

class MedicalMainScreen extends StatelessWidget {
  const MedicalMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
          leading: Container(
            color: Colors.white,
            child: Image.asset("assets/images/MedX logo.png"),
          ),
          actions: [
            Icon(Icons.chat_outlined),
            Icon(Icons.settings),
            Icon(Icons.person),
          ],
        ),
      ),
    );
  }
}
