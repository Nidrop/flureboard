//TODO move all themes here
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = FlexThemeData.light(scheme: FlexScheme.indigo);
  static final darkTheme = FlexThemeData.dark(
    scheme: FlexScheme.indigo,
    darkIsTrueBlack: true,
  );

  // backgroundColor: Theme.of(context).colorScheme.secondary,
  static const secondaryColor = Colors.blueGrey;

  static const double maxFontHeightConstraint = 35;

  static const playerNameTextStyle = TextStyle(fontSize: 25);

  static const centerNumbersTextStyle = TextStyle(fontSize: 28);
  static const centerStringsTextStyle = TextStyle(fontSize: 20);

  static const teamScoreEditTextStyle = TextStyle(
    fontSize: 58,
    fontWeight: FontWeight.bold,
  );

  static const teamScoreTextStyle = TextStyle(
    fontSize: 58,
    fontWeight: FontWeight.bold,
    color: Colors.red,
  );

  static const timerEditTextStyle = TextStyle(
    fontSize: 35,
    fontWeight: FontWeight.bold,
    fontFeatures: [
      FontFeature.tabularFigures(),
    ],
  );

  static const timerTextStyle = TextStyle(
    fontSize: 35,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 0, 255, 0),
    fontFeatures: [
      FontFeature.tabularFigures(),
    ],
  );

  static const timeoutTextStyle = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: Colors.yellow,
    fontFeatures: [
      FontFeature.tabularFigures(),
    ],
  );

  static const playerScoreTextStyle = TextStyle(color: Colors.white);
  static const playerFallsTextStyle = TextStyle(color: Colors.yellow);
}
