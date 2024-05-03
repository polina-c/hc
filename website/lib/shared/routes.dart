import 'package:flutter/material.dart';

enum AppRoutes {
  home(uri: '/', display: 'Home'),
  team(uri: '/team', display: 'Team'),
  ;

  final String uri;
  final String display;

  const AppRoutes({required this.uri, required this.display});
}

void push(AppRoutes route, BuildContext context) {
  Navigator.of(context).pushNamed(route.uri);
}

class AppScreen {
  final VoidCallback? fabCallback;
  final String? fabLabel;
  final WidgetBuilder content;

  const AppScreen(this.content, {this.fabCallback, this.fabLabel});
}
