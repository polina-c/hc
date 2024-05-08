import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
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
      activeLabel(context).copyWith(
        fontSize: FontSizes.appTitle,
        fontFamily: Fonts.headers.fontFamily,
      );
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

  static ButtonStyle fab(BuildContext context) {
    return FilledButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
        side: BorderSide(
          color: AppColors.text,
          width: 2.0,
        ),
      ),
    );
  }
}

abstract class Sizes {
  static const paddingAfterTopBar = 40.0;
  static const markdownWidth = 500.0;
  static const paddingAfterBody = 70.0;
}

final markdownStyleSheet = MarkdownStyleSheet(
  a: const TextStyle(
    color: AppColors.link,
    decoration: TextDecoration.underline,
    decorationColor: AppColors.link,
  ),
  // blockquote: const TextStyle(
  //   color: Colors.grey,
  //   fontStyle: FontStyle.italic,
  // ),
  // code: const TextStyle(
  //   backgroundColor: Colors.grey,
  //   color: Colors.white,
  // ),
  h1: TextStyle(
    fontSize: FontSizes.body + 8,
    fontWeight: FontWeight.bold,
    fontFamily: Fonts.headers.fontFamily,
  ),
  h2: TextStyle(
    fontSize: FontSizes.body + 4,
    fontWeight: FontWeight.bold,
    fontFamily: Fonts.headers.fontFamily,
  ),
  // h3: const TextStyle(
  //   fontSize: FontSizes.body + 4,
  //   fontWeight: FontWeight.bold,
  // ),
  // h4: const TextStyle(
  //   fontSize: FontSizes.body + 2,
  //   fontWeight: FontWeight.bold,
  // ),
  // h5: const TextStyle(
  //   fontSize: FontSizes.body,
  //   fontWeight: FontWeight.bold,
  // ),
  // h6: const TextStyle(
  //   fontSize: FontSizes.body - 2,
  //   fontWeight: FontWeight.bold,
  // ),
  p: TextStyle(
    fontSize: FontSizes.body,
    color: AppColors.text,
  ),
  // tableBody: const TextStyle(
  //   fontSize: FontSizes.body,
  // ),
  // tableHead: const TextStyle(
  //   fontSize: FontSizes.body,
  //   fontWeight: FontWeight.bold,
  // ),
  // listBullet: const TextStyle(
  //   fontSize: FontSizes.body,
  // ),
);
