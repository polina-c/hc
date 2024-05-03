import 'package:flutter/material.dart';

enum AppBarTypes {
  title,
  menuSelected,
  menuClickable,
}

abstract class Styles {
  static ButtonStyle appBarItem(BuildContext context, AppBarTypes type) {
    final theme = Theme.of(context);
    TextStyle textStyle = theme.textTheme.labelLarge!;

    switch (type) {
      case AppBarTypes.title:
        textStyle = textStyle.copyWith(
          fontSize: FontSizes.appTitle,
          fontWeight: FontWeight.w900,
        );
      case AppBarTypes.menuSelected:
        textStyle = textStyle.copyWith(fontWeight: FontWeight.w900);
      case AppBarTypes.menuClickable:
        textStyle = textStyle.copyWith(fontWeight: FontWeight.w100);
    }

    return TextButton.styleFrom(
      disabledForegroundColor: Theme.of(context).colorScheme.primary,
      textStyle: textStyle,
    );
  }
}

abstract class Sizes {
  static const paddingAfterTopBar = 40.0;
  static const markdownWidth = 500.0;
  static const paddingAfterBody = 70.0;
}

abstract class FontSizes {
  static const appTitle = 24.0;
  static const markdown = 16.0;
}
