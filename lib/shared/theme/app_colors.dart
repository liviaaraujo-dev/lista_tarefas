import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

var theme = SchedulerBinding.instance.window.platformBrightness.name;

class AppColors {
  static Color primary = const Color(0xFFFF9B00);
  static Color background =
      theme == 'dark' ? Colors.black : const Color(0xFFF2F2F2);
  static Color background2 =
      theme == 'dark' ? const Color(0XFF1E1E1E) : Colors.white;
  static Color backgroundOrange = theme == 'dark'
      ? Color.fromARGB(255, 88, 66, 16)
      : Color.fromARGB(255, 225, 201, 105);
  static Color text = theme == 'dark' ? Colors.white : Colors.black;
}
