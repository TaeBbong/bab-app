import 'package:flutter/material.dart';

import 'core/themes/dark_theme.dart';
import 'core/themes/light_theme.dart';
import 'presentation/pages/init_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InitPage(),
      debugShowCheckedModeBanner: false,
      theme: LightTheme.theme,
      darkTheme: DarkTheme.theme,
      themeMode: ThemeMode.system,
    );
  }
}
