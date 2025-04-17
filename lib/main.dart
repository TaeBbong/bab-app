import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'core/di/di.dart';
import 'core/themes/dark_theme.dart';
import 'core/themes/light_theme.dart';
import 'data/models/user_info_model.dart';
import 'data/sources/user_info_local_data_source.dart';
import 'presentation/pages/admin_page.dart';
import 'presentation/pages/init_page.dart';
import 'presentation/pages/main_page.dart';
import 'presentation/pages/my_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await configureDependencies();

  final UserInfoLocalDataSource userInfoLocalDataSource =
      getIt<UserInfoLocalDataSource>();
  final UserInfoModel? userInfo = await userInfoLocalDataSource.getUserInfo();
  runApp(MainApp(initialRoute: userInfo == null ? '/init' : '/main'));
}

class MainApp extends StatelessWidget {
  final String initialRoute;
  const MainApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: LightTheme.theme,
      darkTheme: DarkTheme.theme,
      themeMode: ThemeMode.system,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('ko', 'KR'), Locale('en', 'US')],
      initialRoute: initialRoute,
      routes: {
        '/init': (context) => InitPage(),
        '/main': (context) => MainPage(),
        '/my': (context) => MyPage(),
        '/admin': (context) => AdminPage(),
      },
    );
  }
}
