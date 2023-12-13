import 'package:flutter/material.dart';

//Function from hexStringColor to Color
Color hexStringToColor(String hexColor) {
  // Delete the symbol #
  hexColor = hexColor.toUpperCase().replaceAll("#", "");

  if (hexColor.length == 6) {
    hexColor = 'FF$hexColor'; // Interpolation 'FF' without space
  }

  return Color(int.parse(hexColor, radix: 16));
}
