import 'package:flutter/material.dart';

class AppColors {
  static const text = Color.fromARGB(255, 41, 4, 63);
  static const logo = primary;
  static const link = Colors.blueAccent;
  static const primary = Colors.amber;
  static const background = Colors.white;
}

abstract class FontSizes {
  static const appTitle = 24.0;
  static const body = 16.0;
}

final appTheme = ThemeData(
  useMaterial3: true,
  fontFamily: 'Arial',
  // GoogleFonts.comfortaa().fontFamily, // Choose from https://fonts.google.com/

  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: AppColors.primary,
    backgroundColor: AppColors.background,
  ),

  textTheme: const TextTheme(

          //   bodyLarge: test,
          //bodyMedium: test,
          //   bodySmall: test,
          //   displayLarge: test,
          //   displayMedium: test,
          //   displaySmall: test,
          //   headlineLarge: test,
          //   headlineMedium: test,
          //   headlineSmall: test,
          //labelLarge: test,
          // labelMedium: test,
          // labelSmall: test,
          //   titleLarge: test,
          //   titleMedium: test,
          //   titleSmall: test,
          // ),
          // appBarTheme: const AppBarTheme(
          //   // backgroundColor: Colors.white,
          //   // foregroundColor: Colors.black,
          //   titleTextStyle: test,
          //   toolbarTextStyle: test,
          )
      .apply(
    bodyColor: AppColors.text,
    // displayColor: Colors.blue,
  ),
);
