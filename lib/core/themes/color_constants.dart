import 'package:flutter/material.dart';

class ColorConstants {
  ColorConstants._();
  static final ColorConstants _instance = ColorConstants._();
  factory ColorConstants() => _instance;
  Color primaryColor = const Color(0xFFFC9E13);
  Color secondaryColor = const Color(0xFFA5957D);
  Color secondaryTextColor = const Color(0xFF232220);
  Color primaryTextColor = const Color(0xFF171614);
  Color stoneWhite = const Color(0xFFFEFBF7); //
}
