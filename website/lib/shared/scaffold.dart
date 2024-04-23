import 'package:flutter/material.dart';
import 'package:hc_web/shared/theme.dart';

import 'routes.dart';
import 'styles.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold(this.body, this.route, {super.key});

  final Widget body;
  final AppRoutes route;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const ImageIcon(
              AssetImage('lib/assets/logo.png'),
              color: AppColors.logo,
            ),
            _AppBarItem(
              text: 'Happy Creek',
              type: AppBarTypes.title,
              onPressed: route == AppRoutes.home
                  ? null
                  : () => push(AppRoutes.home, context),
            ),
            ...AppRoutes.values
                .map((r) => _MenuItem(route: r, selected: route)),
          ],
        ),
        centerTitle: false,
        automaticallyImplyLeading: false, // Remove back button
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: Sizes.paddingAfterTopBar),
        child: body,
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  const _MenuItem({required this.route, required this.selected});

  final AppRoutes route;
  final AppRoutes selected;

  bool get _isSelected => route == selected;

  @override
  Widget build(BuildContext context) {
    return _AppBarItem(
      onPressed: _isSelected ? null : () => push(route, context),
      type: _isSelected ? AppBarTypes.menuSelected : AppBarTypes.menuClickable,
      text: route.display,
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
    return TextButton(
      onPressed: onPressed,
      style: Styles.appBarItem(context, type),
      child: Text(text),
    );
  }
}
