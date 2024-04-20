import 'package:flutter/material.dart';
import 'package:web/shared/routes.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold(this.body, this.route, {super.key});

  final Widget body;
  final AppRoutes route;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            TextButton(onPressed: () {}, child: const Text('Happy Creek')),
            TextButton(onPressed: () {}, child: const Text('Team')),
          ],
        ),
        centerTitle: false,
        leadingWidth: 0,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: body,
    );
  }
}
