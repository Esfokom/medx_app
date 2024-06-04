import 'package:flutter/material.dart';
import 'package:medx/ThemeDictionary.dart';

class Medicalinfo extends StatelessWidget {
  final String fieldKey;
  final String fieldValue;
  const Medicalinfo(
      {super.key, required this.fieldKey, required this.fieldValue});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Text(
              "$fieldKey:",
              style: ThemeDictionary.grayText,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 6,
            child: Text(
              fieldValue,
              overflow: TextOverflow.ellipsis,
              style: ThemeDictionary.blackText,
            ),
          )
        ],
      ),
    );
  }
}
