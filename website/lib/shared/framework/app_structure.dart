import 'package:flutter/material.dart';

/// Not using enum, because some routes may be dynamic.
class AppRoutes {
  static const String home = '/';
  static const String team = '/team';
  static const String toys = '/toys';
}

const kExperiments = bool.fromEnvironment('experiments', defaultValue: false);

class FeatureFlags {
  // static const bool exploreScreen = kExperiments;
}

class AppMenuItem {
  const AppMenuItem(this.route, this.label);

  final String route;
  final String label;
}

const appMenu = [
  AppMenuItem(AppRoutes.home, 'Home'),
  AppMenuItem(AppRoutes.toys, 'Toys'),
  AppMenuItem(AppRoutes.team, 'Team'),
];

void push(String route, BuildContext context) {
  Navigator.of(context).pushNamed(route);
}
