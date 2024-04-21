enum AppRoutes {
  home(uri: '/', display: 'Home'),
  team(uri: '/team', display: 'Team'),
  ;

  final String uri;
  final String display;

  const AppRoutes({required this.uri, required this.display});
}
