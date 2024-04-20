import 'package:flutter/material.dart';
import 'package:web/shared/scaffold.dart';

import 'screens/home.dart';
import 'screens/team.dart';
import 'shared/routes.dart';

final routes = {
  AppRoutes.home: (context) => const HomeScreen(),
  AppRoutes.team: (context) => const TeamScreen(),
};

WidgetBuilder routeEntry(AppRoutes route) {
  return (context) => AppScaffold(routes[route]!(context), route);
}

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Happy Creek',
      initialRoute: AppRoutes.home.uri,
      routes: routes.map((route, _) => MapEntry(route.uri, routeEntry(route))),
    );
  }
}
