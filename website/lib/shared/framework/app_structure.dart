import 'package:flutter/material.dart';

/// Not using enum, because some routes may be dynamic.
class AppRoutes {
  static const String home = '/';
  static const String team = '/team';
  static const String explore = '/explore';
}

const kExperiments = bool.fromEnvironment('experiments', defaultValue: false);

class FeatureFlags {
  static const bool exploreScreen = kExperiments;
}

const appMenu = {
  AppRoutes.home: 'Home',
  if (FeatureFlags.exploreScreen) AppRoutes.explore: 'Explore',
  AppRoutes.team: 'Team',
};

void push(String route, BuildContext context) {
  Navigator.of(context).pushNamed(route);
}
