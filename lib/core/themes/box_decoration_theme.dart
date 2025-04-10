import 'package:flutter/material.dart';

class BoxDecorationTheme extends ThemeExtension<BoxDecorationTheme> {
  final BoxDecoration card;
  const BoxDecorationTheme({required this.card});
  @override
  ThemeExtension<BoxDecorationTheme> copyWith({BoxDecoration? card}) {
    return BoxDecorationTheme(card: card ?? this.card);
  }

  @override
  ThemeExtension<BoxDecorationTheme> lerp(
    ThemeExtension<BoxDecorationTheme>? other,
    double t,
  ) {
    if (other is! BoxDecorationTheme) return this;
    return BoxDecorationTheme(card: BoxDecoration.lerp(card, other.card, t)!);
  }
}
