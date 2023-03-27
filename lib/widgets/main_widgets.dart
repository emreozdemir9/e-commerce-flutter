import 'package:flutter/material.dart';

class MainWidgets {
  // Main Text
  static Widget mainText(String text,
      {FontWeight weight = FontWeight.w500,
      Color color = Colors.white,
      double fontSize = 16}) {
    return Text(
      text,
      style: TextStyle(color: color, fontWeight: weight, fontSize: fontSize),
      textAlign: TextAlign.center,
    );
  }
}
