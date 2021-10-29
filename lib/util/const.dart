import 'package:flutter/material.dart';

class Constants {
  static String appName = "La Piccolina";

  //Colors for theme
//  Color(0xfffcfcff);
  static Color lightPrimary = Color(0xfffcfcff);
  static Color darkPrimary = Colors.black;
  static Color lightAccent = Colors.red;
  static Color darkAccent = Colors.red[400];
  static Color lightBG = Color(0xfffcfcff);
  static Color darkBG = Colors.black;
  static Color ratingBG = Colors.yellow[600];

  static ThemeData lightTheme = ThemeData(
    backgroundColor: lightBG,
    primaryColor: lightPrimary,
    colorScheme:
        ColorScheme.light(primary: lightPrimary, secondary: lightAccent),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: lightAccent,
    ),
    iconTheme: IconThemeData(color: darkBG),
    scaffoldBackgroundColor: lightBG,
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
        color: darkBG,
        fontSize: 18.0,
        fontWeight: FontWeight.w800,
      ),
//      iconTheme: IconThemeData(
//        color: lightAccent,
//      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: darkBG,
    primaryColor: darkPrimary,
    colorScheme: ColorScheme.dark(secondary: darkAccent),
    scaffoldBackgroundColor: darkBG,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: darkAccent,
    ),
    iconTheme: IconThemeData(color: lightPrimary),
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
        color: lightBG,
        fontSize: 18.0,
        fontWeight: FontWeight.w800,
      ),

//      iconTheme: IconThemeData(
//        color: darkAccent,
//      ),
    ),
  );
}
