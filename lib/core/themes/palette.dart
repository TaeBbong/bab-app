import 'package:flutter/material.dart';

abstract class Palette {
  /// Chromatic color
  static Color burgundy = const Color(0xFF800020);
  static const Color burgundy200 = Color(0xFFDAA5B3); // 밝은 톤
  static const Color burgundy400 = Color(0xFFB25D75); // 중간 톤
  static const Color burgundy600 = Color(0xFF99334C); // 살짝 진한 톤
  static const Color burgundy800 = Color(0xFF660018); // 어두운 톤

  static Color beige = const Color(0xFFF5E6CC); // 베이지
  static Color beige100 = const Color(0xFFFAF1E3);

  static const Color deepPurple200 = Color(0xFFB39DDB); // 연한 보라
  static const Color deepPurple400 = Color(0xFF7E57C2); // 중간 보라
  static const Color deepPurple600 = Color(0xFF5E35B1); // 진한 보라
  static const Color deepPurple800 = Color(0xFF4527A0); // 아주 진한 보라
  static const Color deepPurple = Color(0xFF673AB7); // 메인

  // 배경 & 보조 색상
  static const Color lavender = Color(0xFFEDE7F6); // 밝은 보라 배경
  static const Color lightGray = Color(0xFFF5F5F5); // 연한 회색
  static const Color gray = Color(0xFF9E9E9E); // 본문용 회색
  static const Color darkGray = Color(0xFF424242); // 다크 텍스트

  /// Achromatic color
  static Color white = const Color(0xFFFFFFFF);
  static Color grey100 = const Color(0xFFFAFAFA);
  static Color grey150 = const Color(0xFFF5F5F5);
  static Color grey200 = const Color(0xFFEFEFEF);
  static Color grey250 = const Color(0xFFE8E8E8);
  static Color grey300 = const Color(0xFFDFDFDF);
  static Color grey400 = const Color(0xFFB7B7B7);
  static Color grey500 = const Color(0xFF949494);
  static Color grey600 = const Color(0xFF777777);
  static Color grey700 = const Color(0xFF555555);
  static Color grey800 = const Color(0xFF2A2A2A);
  static Color grey900 = const Color(0xFF111111);
  static Color black = const Color(0xFF000000);

  // 강조 색상 (상태)
  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFF44336);
  static const Color warning = Color(0xFFFFA726);
}
