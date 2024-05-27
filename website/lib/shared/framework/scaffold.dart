import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hc_web/shared/design/theme.dart';

import '../bricks/text.dart';
import '../bricks/utils.dart';
import 'app_structure.dart';
import 'screen.dart';
import '../design/styles.dart';

const _version = 2;

class AppScaffold extends StatelessWidget {
  const AppScaffold(
    this.route,
    this.screen, {
    super.key,
  });

  final AppScreen screen;
  final String route;

  @override
  Widget build(BuildContext context) {
    return new DefaultTextStyle(
      style: new TextStyle(
        inherit: true,
        fontSize: FontSizes.body,
        color: AppColors.text,
      ),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: Sizes.toolbarHeight,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const ImageIcon(
                    AssetImage('assets/logo.png'),
                    color: AppColors.logo,
                  ),
                  _AppBarItem(
                    text: 'Happy Creek',
                    type: AppBarTypes.title,
                    onPressed: route == AppRoutes.home
                        ? null
                        : () => push(AppRoutes.home, context),
                  ),
                  ...appMenu.entries.map(
                    (e) => _MenuItem(
                      route: e.key,
                      selected: route,
                      displayName: e.value,
                    ),
                  ),
                ],
              ),
              SizedBox(height: Sizes.sublineSpace),
              _AppBarItem(
                text: 'Emotional and social education for children',
                type: AppBarTypes.subLine,
              ),
            ],
          ),
          centerTitle: false,
          automaticallyImplyLeading: false, // Remove back button
          backgroundColor: AppColors.background,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: Sizes.paddingAfterTopBar),
                screen.content(context),
                const SizedBox(height: Sizes.paddingAfterBody),
                Image.asset('${imagePath}images/ds.png'),
                Text('${defaultTargetPlatform.name}, $_version'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  const _MenuItem({
    required this.route,
    required this.selected,
    required this.displayName,
  });

  final String route;
  final String selected;
  final String displayName;

  bool get _isSelected => route == selected;

  @override
  Widget build(BuildContext context) {
    return _AppBarItem(
      onPressed: _isSelected ? null : () => push(route, context),
      type: _isSelected ? AppBarTypes.menuSelected : AppBarTypes.menuClickable,
      text: displayName,
    );
  }
}

class _AppBarItem extends StatelessWidget {
  const _AppBarItem({this.onPressed, required this.text, required this.type});

  final VoidCallback? onPressed;
  final AppBarTypes type;
  final String text;

  @override
  Widget build(BuildContext context) {
    if (type == AppBarTypes.subLine) {
      return AppText(
        text,
        // style: TextStyles.subLine(context),
        textAlign: TextAlign.left,
      );
    }
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyles.appBarItem(context, type),
      child: Text(text),
    );
  }
}
