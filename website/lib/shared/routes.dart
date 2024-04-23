import 'package:flutter/widgets.dart';

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
