import 'package:flutter/material.dart';
import 'box_decoration_theme.dart';
import 'palette.dart';

class LightTheme {
  static ThemeData get theme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Palette.deepPurple,
      scaffoldBackgroundColor: Palette.white,
      textTheme: TextTheme(
        displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        displaySmall: TextStyle(fontSize: 16, color: Palette.grey500),
        titleLarge: TextStyle(
          color: Palette.grey900,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        titleMedium: TextStyle(
          color: Palette.grey800,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        titleSmall: TextStyle(
          color: Palette.grey700,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: TextStyle(color: Palette.grey900, fontSize: 18),
        bodyMedium: TextStyle(color: Palette.grey800, fontSize: 16),
        bodySmall: TextStyle(color: Palette.grey700, fontSize: 14),
        labelMedium: TextStyle(color: Palette.error, fontSize: 16),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Palette.white,
        foregroundColor: Palette.deepPurple,
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Palette.deepPurple),
          foregroundColor: WidgetStatePropertyAll(Palette.white),
          textStyle: WidgetStatePropertyAll(TextStyle(fontSize: 18)),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
      iconTheme: IconThemeData(color: Palette.deepPurple),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Palette.grey100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Palette.deepPurple),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Palette.deepPurple, width: 2),
        ),
        hintStyle: TextStyle(fontSize: 12, color: Palette.grey500),
        labelStyle: TextStyle(fontSize: 14, color: Palette.grey500),
      ),
      extensions: [
        BoxDecorationTheme(
          card: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.shade300),
          ),
        ),
      ],
    );
  }
}
