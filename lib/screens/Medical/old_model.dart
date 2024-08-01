import 'package:flutter/material.dart';
import 'package:medx/ThemeDictionary.dart';

class OldModel extends StatefulWidget {
  const OldModel({super.key});

  @override
  State<OldModel> createState() => _OldModelState();
}

class _OldModelState extends State<OldModel> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Visibility(
            visible: false,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "id_search");
              },
              style: ThemeDictionary.grayButtonStyle,
              child: const Text(
                "Patient Database",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 20),
              ),
            ),
          ),
          Visibility(
            visible: false,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "personal_patients");
              },
              style: ThemeDictionary.grayButtonStyle,
              child: const Text(
                "Personal Patients",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 20),
              ),
            ),
          ),
          Visibility(
            visible: false,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "requests");
              },
              style: ThemeDictionary.grayButtonStyle,
              child: const Text(
                "Requests",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 20),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, "records");
            },
            style: ThemeDictionary.grayButtonStyle,
            child: const Text(
              "Records",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, "new_record");
            },
            style: ThemeDictionary.grayButtonStyle,
            child: const Text(
              "New Record",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
