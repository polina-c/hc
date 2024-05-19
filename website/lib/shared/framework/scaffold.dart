import 'package:flutter/material.dart';
import 'package:hc_web/shared/design/theme.dart';

import 'routes.dart';
import '../design/styles.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold(
    this.route,
    this.screen, {
    super.key,
  });

  final AppScreen screen;
  final AppRoutes route;

  @override
  Widget build(BuildContext context) {
    final Widget? fab = screen.fabCallback == null
        ? null
        : FilledButton(
            style: ButtonStyles.fab(context),
            onPressed: screen.fabCallback,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                screen.fabLabel!,
                style: TextStyles.activeLabel(context),
              ),
            ),
          );

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
                .where((r) => r.show)
                .map((r) => _MenuItem(route: r, selected: route)),
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
              if (fab != null) fab,
              const SizedBox(height: Sizes.paddingAfterBody),
              Image.asset('lib/assets/images/ds.png'),
            ],
          ),
        ),
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
      style: ButtonStyles.appBarItem(context, type),
      child: Text(text),
    );
  }
}