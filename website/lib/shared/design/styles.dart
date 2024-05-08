import 'package:flutter/material.dart';
import 'package:hc_web/shared/design/theme.dart';

enum AppBarTypes {
  title,
  menuSelected,
  menuClickable,
}

abstract class TextStyles {
  static TextStyle normalLabel(BuildContext context) {
    final theme = Theme.of(context);
    return theme.textTheme.labelLarge!.copyWith(
      fontWeight: FontWeight.w100,
      color: AppColors.text,
    );
  }

  static TextStyle activeLabel(BuildContext context) =>
      normalLabel(context).copyWith(fontWeight: FontWeight.w900);

  static TextStyle titleLabel(BuildContext context) =>
      activeLabel(context).copyWith(fontSize: FontSizes.appTitle);
}

abstract class ButtonStyles {
  static ButtonStyle appBarItem(BuildContext context, AppBarTypes type) {
    final textStyle = switch (type) {
      AppBarTypes.title => TextStyles.titleLabel(context),
      AppBarTypes.menuSelected => TextStyles.activeLabel(context),
      AppBarTypes.menuClickable => TextStyles.normalLabel(context),
    };

    return TextButton.styleFrom(
      disabledForegroundColor: AppColors.text,
      foregroundColor: AppColors.text,
      textStyle: textStyle,
    );
  }
}

abstract class Sizes {
  static const paddingAfterTopBar = 40.0;
  static const markdownWidth = 500.0;
  static const paddingAfterBody = 70.0;
}
