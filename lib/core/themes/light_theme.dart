import 'package:flutter/material.dart';
import 'palette.dart';

class LightTheme {
  static ThemeData get theme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Palette.burgundy,
      scaffoldBackgroundColor: Palette.white,
      textTheme: TextTheme(
        displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        displaySmall: TextStyle(fontSize: 16, color: Palette.grey500),
        bodyLarge: TextStyle(color: Palette.grey900, fontSize: 18),
        bodyMedium: TextStyle(color: Palette.grey800, fontSize: 16),
        bodySmall: TextStyle(color: Palette.grey700, fontSize: 14),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Palette.white,
        foregroundColor: Palette.burgundy,
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(Palette.black),
          textStyle: WidgetStatePropertyAll(TextStyle(fontSize: 18)),
        ),
      ),
      iconTheme: IconThemeData(color: Palette.burgundy),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Palette.grey100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Palette.burgundy),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Palette.burgundy, width: 2),
        ),
        hintStyle: TextStyle(fontSize: 12, color: Palette.grey500),
        labelStyle: TextStyle(fontSize: 14, color: Palette.grey500),
      ),
    );
  }
}
