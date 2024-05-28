import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:hc_web/shared/design/theme.dart';

import 'border.dart';

enum AppBarTypes {
  title,
  menuSelected,
  menuClickable,
}

abstract class TextStyles {
  static TextStyle normal(BuildContext context) {
    final theme = Theme.of(context);
    return theme.textTheme.labelLarge!.copyWith(
      fontWeight: FontWeight.w100,
      color: AppColors.text,
      fontSize: FontSizes.body,
    );
  }

  static TextStyle activeMenu(BuildContext context) =>
      normal(context).copyWith(fontWeight: FontWeight.w900);

  static TextStyle title(BuildContext context) => activeMenu(context).copyWith(
        fontSize: FontSizes.appTitle,
        fontFamily: Fonts.headers.fontFamily,
      );

  static TextStyle subLine(BuildContext context) => normal(context)
      .copyWith(fontWeight: FontWeight.w600, color: AppColors.subLine);
}

abstract class ButtonStyles {
  static ButtonStyle appBarItem(BuildContext context, AppBarTypes type) {
    final textStyle = switch (type) {
      AppBarTypes.title => TextStyles.title(context),
      AppBarTypes.menuSelected => TextStyles.activeMenu(context),
      AppBarTypes.menuClickable => TextStyles.normal(context),
    };

    return TextButton.styleFrom(
      disabledForegroundColor: AppColors.text,
      foregroundColor: AppColors.text,
      textStyle: textStyle,
    );
  }

  static ButtonStyle fab(BuildContext context) {
    return FilledButton.styleFrom(shape: borderedShape);
  }
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
