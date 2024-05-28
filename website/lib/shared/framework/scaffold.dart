import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hc_web/shared/design/theme.dart';

import '../bricks/text.dart';
import '../bricks/utils.dart';
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
    final screenWidth = MediaQuery.of(context).size.width;
    final bool hamburger = screenWidth < 600;

    return new DefaultTextStyle(
      style: new TextStyle(
        inherit: true,
        fontSize: FontSizes.body,
        color: AppColors.text,
      ),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 140,
          title: Column(
            children: [
              Row(
                children: [
                  ImageIcon(
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
                  Expanded(child: SizedBox()),
                  if (hamburger) _Hamburger(route) else _Menu(route),
                ],
              ),
              Divider(color: AppColors.divider, thickness: 1),
              Center(
                child: AppText(
                  'Emotional and Social Education for Children',
                  style: TextStyles.subLine(context),
                  textAlign: TextAlign.center,
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
                const SizedBox(height: 20),
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

class _Menu extends StatelessWidget {
  const _Menu(this.route);

  final String route;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: appMenu.entries
          .map(
            (e) => _MenuItem(
              route: e.key,
              selected: route,
              displayName: e.value,
            ),
          )
          .toList(),
    );
  }
}

class _Hamburger extends StatelessWidget {
  const _Hamburger(this.route);

  final String route;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: Icon(Icons.more_vert),
      itemBuilder: (BuildContext context) {
        return appMenu.entries.map((e) {
          return PopupMenuItem<String>(
            value: 'menuItem',
            child: _MenuItem(
              route: e.key,
              selected: route,
              displayName: e.value,
            ),
          );
        }).toList();
      },
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
