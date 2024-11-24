import 'package:flutter/material.dart';

class ThemeConfig {
  //App related strings
  static String appName = "Spotify";

  //Colors for theme
  static Color lightPrimary = const Color(0xfff3f4f9);
  static Color darkPrimary = const Color(0xff191414);

  static Color lightAccent = const Color(0xff1DB954);

  static Color darkAccent = const Color(0xff1DB954);

  static Color lightBG = const Color(0xfff3f4f9);
  static Color darkBG = const Color(0xff2B2B2B);

  static ThemeData darkTheme = ThemeData(
    useMaterial3: false,
    fontFamily: 'Gotham Light',
    primaryColor: darkPrimary,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: darkAccent,
    ),
    scaffoldBackgroundColor: darkBG,
    bottomAppBarTheme: BottomAppBarTheme(
      elevation: 0,
      color: darkBG,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        fontFamily: 'Gotham Light',
        color: Colors.white,
      ),
      bodySmall: TextStyle(
        fontFamily: 'Gotham Light',
        color: Colors.white,
      ),
    ),
    appBarTheme: AppBarTheme(
      elevation: 0.0,
      backgroundColor: darkBG,
      iconTheme: const IconThemeData(color: Colors.white),
      titleTextStyle: const TextStyle(
        fontFamily: 'Gotham Bold',
        color: Colors.white,
      ),
    ),
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(secondary: darkAccent)
        .copyWith(surface: darkBG),
  );
}
