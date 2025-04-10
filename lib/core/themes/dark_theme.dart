import 'package:flutter/material.dart';
import 'palette.dart';

class DarkTheme {
  static ThemeData get theme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: Palette.burgundy,
      scaffoldBackgroundColor: Palette.grey900,
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Palette.beige,
        ),
        displaySmall: TextStyle(fontSize: 16, color: Palette.grey400),
        bodyLarge: TextStyle(color: Palette.beige, fontSize: 18),
        bodyMedium: TextStyle(color: Palette.grey300, fontSize: 16),
        bodySmall: TextStyle(color: Palette.grey400, fontSize: 14),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Palette.black,
        foregroundColor: Palette.beige,
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Palette.grey800),
          foregroundColor: WidgetStatePropertyAll(Palette.white),
          textStyle: WidgetStatePropertyAll(TextStyle(fontSize: 18)),
        ),
      ),
      iconTheme: IconThemeData(color: Palette.beige),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Palette.grey800,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Palette.beige),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Palette.beige, width: 2),
        ),
        hintStyle: TextStyle(fontSize: 12, color: Palette.grey500),
        labelStyle: TextStyle(fontSize: 14, color: Palette.grey500),
      ),
    );
  }
}
