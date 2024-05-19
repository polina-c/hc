import 'package:flutter/material.dart';

import 'shared/design/theme.dart';
import 'screens/home.dart';
import 'screens/team.dart';
import 'shared/framework/routes.dart';
import 'shared/framework/scaffold.dart';

final routes = <AppRoutes, AppScreen>{
  AppRoutes.home: homeScreen,
  AppRoutes.explore: AppScreen(
    (_) => const Center(
      child: Text('Explore'),
    ),
    fabCallback: () => print('Explore'),
    fabLabel: 'Explore',
  ),
  AppRoutes.team: teamScreen,
};

WidgetBuilder routeEntry(String routeName) {
  final route = AppRoutes.values.firstWhere(
    (r) => r.uri == routeName,
    orElse: () => AppRoutes.home,
  );
  final screen = routes[route]!;
  return (context) => AppScaffold(
        route,
        screen,
      );
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
