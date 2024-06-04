import 'package:flutter/material.dart';

class ThemeDictionary {
  static const ButtonStyle grayButtonStyle = ButtonStyle(
      foregroundColor: WidgetStatePropertyAll(Colors.white),
      backgroundColor: WidgetStatePropertyAll(Colors.white38),
      minimumSize: WidgetStatePropertyAll(Size(250, 100)));

  static const TextStyle grayText = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.italic,
      color: Colors.black54);

  static const TextStyle blackText = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      color: Colors.black);
}
