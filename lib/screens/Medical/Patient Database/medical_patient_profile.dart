import 'package:flutter/material.dart';
import 'package:medx/user_controls/user_controls.dart';

import '../../../ThemeDictionary.dart';

class MedicalPatientProfile extends StatelessWidget {
  const MedicalPatientProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          title: Center(child: Text("Patient Profile")),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                const CircleAvatar(
                  radius: 150,
                  child: Icon(
                    Icons.person,
                    size: 200,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Medicalinfo(
                    fieldKey: "Name", fieldValue: "Ansu Kwakye Ameyaw"),
                const Medicalinfo(
                    fieldKey: "Set General Practitioner",
                    fieldValue: "Ansu Kwakye Ameyaw"),
                const Medicalinfo(
                    fieldKey: "Set Usual Hospital", fieldValue: "Lorem Ipsum"),
                const Medicalinfo(fieldKey: "Email", fieldValue: "Lorem Ipsum"),
                const Medicalinfo(
                    fieldKey: "Number", fieldValue: "Lorem Ipsum"),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child: Row(
                    children: [
                      const Text(
                        "Sickling: ",
                        style: ThemeDictionary.grayText,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Checkbox(
                        value: false,
                        onChanged: (value) => true,
                      )
                    ],
                  ),
                ),
                const Medicalinfo(
                    fieldKey: "Blood Type", fieldValue: "Lorem Ipsum"),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ThemeDictionary.grayButtonStyle,
                  onPressed: () {},
                  child: const Text(
                    "Send Request For Medical Data",
                    style: ThemeDictionary.blackText,
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
