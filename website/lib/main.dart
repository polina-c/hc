import 'package:flutter/material.dart';
import 'package:hc_web/screens/explore.dart';

import 'shared/design/theme.dart';
import 'screens/home.dart';
import 'screens/team.dart';
import 'shared/framework/screen.dart';
import 'shared/framework/scaffold.dart';

const _homeRoute = '/';

final _routes = <String, AppScreen>{
  _homeRoute: homeScreen,
  '/explore': exploreScreen,
  '/team': teamScreen,
};

void main() {
  runApp(const _MainApp());
}

class _MainApp extends StatelessWidget {
  const _MainApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Happy Creek',
      theme: appTheme,
      initialRoute: _homeRoute,
      // Using this instead of [routes] to turn off animation.
      onGenerateRoute: (settings) {
        final routeName = settings.name ?? _homeRoute;
        return PageRouteBuilder(
          pageBuilder: (context, __, ___) => _routeEntry(routeName)(context),
          transitionsBuilder: (_, __, ___, child) => child,
          settings: settings,
        );
      },
    );
  }
}

WidgetBuilder _routeEntry(String route) {
  final screen = _routes[route] ?? homeScreen;

  return (context) => AppScaffold(
        route,
        screen,
      );
}
