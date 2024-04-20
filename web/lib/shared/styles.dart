import 'package:flutter/material.dart';

abstract class Styles {
  static ButtonStyle disabledSelected(BuildContext context) =>
      TextButton.styleFrom(
        disabledForegroundColor: Theme.of(context).colorScheme.primary,
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
      );
}

abstract class Sizes {
  static const markdownWidth = 500.0;
}
