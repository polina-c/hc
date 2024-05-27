import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const text = Color.fromARGB(255, 41, 4, 63);
  static const border = text;
  static const logo = Colors.amber;
  static const link = Colors.blueAccent;
  static const primary = Colors.yellow; // #FFC107
  static const background = Colors.white;
  static const subLine = Colors.blue;
  static const card = const Color.fromARGB(255, 171, 228, 255);
}

abstract class Sizes {
  static const columnWidth = 500.0;
  static const paddingAfterBody = 70.0;
  static const border = 2.0;
}

abstract class FontSizes {
  static const appTitle = 26.0;
  static const body = 18.0;
}

/// Choose fonts from https://fonts.google.com/
abstract class Fonts {
  static late final body = GoogleFonts.poppins(); // poppins or montserrat
  static late final headers = GoogleFonts.outfit(); // paytoneOne or rowdies
}

final appTheme = ThemeData(
  useMaterial3: true,
  fontFamily: Fonts.body.fontFamily,
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: AppColors.primary,
    backgroundColor: AppColors.background,
  ),
  // textTheme: const TextTheme(
  //         //   bodyLarge: test,
  //         //bodyMedium: test,
  //         //   bodySmall: test,
  //         //   displayLarge: test,
  //         //   displayMedium: test,
  //         //   displaySmall: test,
  //         //   headlineLarge: test,
  //         //   headlineMedium: test,
  //         //   headlineSmall: test,
  //         //labelLarge: test,
  //         // labelMedium: test,
  //         // labelSmall: test,
  //         //   titleLarge: test,
  //         //   titleMedium: test,
  //         //   titleSmall: test,
  //         // ),
  //         // appBarTheme: const AppBarTheme(
  //         //   // backgroundColor: Colors.white,
  //         //   // foregroundColor: Colors.black,
  //         //   titleTextStyle: test,
  //         //   toolbarTextStyle: test,
  //         )
  //     .apply(
  //   bodyColor: AppColors.text,

  // displayColor: Colors.blue,
);
