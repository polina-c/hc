import 'package:flutter/material.dart';

import '../shared/theme.dart';
import 'screens/home.dart';
import 'screens/team.dart';
import 'shared/routes.dart';
import 'shared/scaffold.dart';

final routes = {
  AppRoutes.home: (context) => const HomeScreen(),
  AppRoutes.team: (context) => const TeamScreen(),
};

WidgetBuilder routeEntry(String routeName) {
  final route = AppRoutes.values.firstWhere(
    (r) => r.uri == routeName,
    orElse: () => AppRoutes.home,
  );
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
      theme: appTheme,
      initialRoute: AppRoutes.home.uri,
      // Using this instead of [routes] to turn off animation.
      onGenerateRoute: (settings) {
        final routeName = settings.name ?? AppRoutes.home.uri;
        return PageRouteBuilder(
          pageBuilder: (context, __, ___) => routeEntry(routeName)(context),
          transitionsBuilder: (_, __, ___, child) => child,
          settings: settings,
        );
      },
    );
  }
}
