import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'screens/home.dart';
import 'screens/team.dart';
import 'screens/toys/toys.dart';
import 'shared/design/theme.dart';
import 'shared/framework/app_structure.dart';
import 'shared/framework/scaffold.dart';
import 'shared/framework/screen.dart';

final _screens = <String, AppScreen>{
  AppRoutes.home: homeScreen,
  AppRoutes.toys: toysScreen,
  AppRoutes.team: teamScreen,
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
      initialRoute: AppRoutes.home,
      // Using this instead of [routes] to turn off animation.
      onGenerateRoute: (settings) {
        final route = settings.name ?? AppRoutes.home;
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
