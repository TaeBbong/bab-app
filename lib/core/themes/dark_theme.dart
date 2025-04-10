import 'package:flutter/material.dart';
import 'box_decoration_theme.dart';
import 'palette.dart';

class DarkTheme {
  static ThemeData get theme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: Palette.deepPurple,
      scaffoldBackgroundColor: Palette.grey800,
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Palette.white,
        ),
        displaySmall: TextStyle(fontSize: 16, color: Palette.grey300),
        titleLarge: TextStyle(
          color: Palette.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        titleMedium: TextStyle(
          color: Palette.grey100,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        titleSmall: TextStyle(
          color: Palette.grey300,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: TextStyle(color: Palette.white, fontSize: 18),
        bodyMedium: TextStyle(color: Palette.grey100, fontSize: 16),
        bodySmall: TextStyle(color: Palette.grey300, fontSize: 14),
        labelMedium: TextStyle(color: Palette.error, fontSize: 16),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Palette.grey800,
        foregroundColor: Palette.deepPurple200,
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Palette.deepPurple600),
          foregroundColor: WidgetStatePropertyAll(Palette.white),
          textStyle: WidgetStatePropertyAll(TextStyle(fontSize: 18)),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
      iconTheme: const IconThemeData(color: Palette.deepPurple200),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Palette.grey800,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Palette.deepPurple400),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Palette.deepPurple400, width: 2),
        ),
        hintStyle: TextStyle(fontSize: 12, color: Palette.grey400),
        labelStyle: TextStyle(fontSize: 14, color: Palette.grey400),
      ),
      extensions: [
        BoxDecorationTheme(
          card: BoxDecoration(
            color: Palette.grey800,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Palette.grey700),
          ),
        ),
      ],
    );
  }
}
