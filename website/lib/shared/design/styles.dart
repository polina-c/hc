import 'package:flutter/material.dart';

enum AppBarTypes {
  title,
  menuSelected,
  menuClickable,
}

abstract class Styles {
  static TextStyle normalLabel(BuildContext context) {
    final theme = Theme.of(context);
    return theme.textTheme.labelLarge!.copyWith(
      fontWeight: FontWeight.w100,
      color: theme.colorScheme.primary,
    );
  }

  static TextStyle activeLabel(BuildContext context) =>
      normalLabel(context).copyWith(fontWeight: FontWeight.w900);

  static TextStyle titleLabel(BuildContext context) =>
      activeLabel(context).copyWith(fontSize: FontSizes.appTitle);

  static ButtonStyle appBarItem(BuildContext context, AppBarTypes type) {
    final textStyle = switch (type) {
      AppBarTypes.title => titleLabel(context),
      AppBarTypes.menuSelected => activeLabel(context),
      AppBarTypes.menuClickable => normalLabel(context),
    };

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
