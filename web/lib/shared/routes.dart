enum AppRoutes {
  home(uri: '/'),
  team(uri: '/'),
  ;

  final String uri;

  const AppRoutes({required this.uri});
}
