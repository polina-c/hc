enum AppRoutes {
  home(uri: '/', display: 'Happy Creek'),
  team(uri: '/team', display: 'Team'),
  ;

  final String uri;
  final String display;

  const AppRoutes({required this.uri, required this.display});
}
