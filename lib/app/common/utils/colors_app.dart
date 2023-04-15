import 'package:flutter/material.dart';

class ColorsApp {
  static const Color green100 = Color(0xFF116814);
  static const Color green150 = Color(0xFF1A991F);
  static const Color green200 = Color(0xFF31D036);
  static const Color green250 = Color(0xFF68F96D);
  static const Color black100 = Color(0xFF000000);
  static const Color white100 = Color(0xFFFFFFFF);
  static const Color white150 = Color(0xFFD9D9D9);

  static const linearGradientBlue = LinearGradient(
    colors: [
      green100,
      green250,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
