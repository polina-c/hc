import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hc_web/shared/design/theme.dart';

import 'app_structure.dart';
import 'screen.dart';
import '../design/styles.dart';

const _version = 7;

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
              Image.asset('assets/images/ds.png'),
              Text('${defaultTargetPlatform.name}, $_version'),
            ],
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
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyles.appBarItem(context, type),
      child: Text(text),
    );
  }
}
