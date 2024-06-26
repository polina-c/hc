import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hc_web/screens/toys/toys.dart';

import 'firebase_options.dart';
import 'shared/design/theme.dart';
import 'screens/home.dart';
import 'screens/team.dart';
import 'shared/framework/screen.dart';
import 'shared/framework/scaffold.dart';

const _homeRoute = '/';

final _screens = <String, AppScreen>{
  _homeRoute: homeScreen,
  '/toys': toysScreen,
  '/team': teamScreen,
};

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Happy Creek',
      theme: appTheme,
      initialRoute: _homeRoute,
      // Using this instead of [routes] to turn off animation.
      onGenerateRoute: (settings) {
        final route = settings.name ?? _homeRoute;
        return PageRouteBuilder(
          pageBuilder: (context, __, ___) =>
              AppScaffold(route, _screens[route] ?? homeScreen),
          transitionsBuilder: (_, __, ___, child) => child,
          settings: settings,
        );
      },
    );
  }
}
