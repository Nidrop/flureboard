import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flureboard/features/main_page/main_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flureboard',
      theme: FlexThemeData.light(scheme: FlexScheme.indigo),
      darkTheme: FlexThemeData.dark(
        scheme: FlexScheme.indigo,
        darkIsTrueBlack: true,
      ),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
    );
  }
}
