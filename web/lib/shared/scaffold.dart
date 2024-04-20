import 'package:flutter/material.dart';
import 'package:web/shared/routes.dart';

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
          children: AppRoutes.values
              .map((r) => MenuItem(route: r, selected: route))
              .toList(),
        ),
        centerTitle: false,
        automaticallyImplyLeading: false, // Remove back button
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: body,
    );
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem({super.key, required this.route, required this.selected});

  final AppRoutes route;
  final AppRoutes selected;

  bool get _isSelected => route == selected;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed:
          _isSelected ? null : () => Navigator.of(context).pushNamed(route.uri),
      style: _isSelected ? Styles.disabledSelected(context) : null,
      child: Text(route.display),
    );
  }
}
