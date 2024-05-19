import 'package:flutter/material.dart';
import 'package:hc_web/shared/framework/feature_flags.dart';

enum AppRoutes {
  home(uri: '/', display: 'Home'),
  explore(
    uri: '/explore',
    display: 'Explore',
    show: FeatureFlags.exploreScreen,
  ),
  team(uri: '/team', display: 'Team'),
  ;

  final String uri;
  final String display;
  final bool show;

  const AppRoutes({required this.uri, required this.display, this.show = true});
}

void push(AppRoutes route, BuildContext context) {
  Navigator.of(context).pushNamed(route.uri);
}

/// Non-constant screen data.
///
/// Mapped to [AppRoutes] in main.dart.
class AppScreen {
  final VoidCallback? fabCallback;
  final String? fabLabel;
  final WidgetBuilder content;

  const AppScreen(this.content, {this.fabCallback, this.fabLabel});
}
