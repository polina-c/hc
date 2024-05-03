import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../shared/markdown.dart';
import '../shared/routes.dart';

late final homeScreen = AppScreen(
  (_) => const _Screen(),
  fabCallback: () => launchUrl(
    Uri.parse(
      'https://docs.google.com/document/d/1ZNrNoxZKZmkcF75ZyGUHrV3UPyJnhEjyVhh3ubYwXFM',
    ),
  ),
  fabLabel: 'Read More',
);

class _Screen extends StatelessWidget {
  const _Screen();

  @override
  Widget build(BuildContext context) {
    const teamLink = 'team';
    return AppMarkdown(
      '''
**Happy Creek** aims to provide **emotional and
social education** for elementary and middle
scroll children via a **role-playing computer game**.

We are in the phase of prototyping.
If you are interested in joining us, please reach out to us.

\v

[Our Team]($teamLink)
''',
      onTapLink: {
        teamLink: () => push(AppRoutes.team, context),
      },
    );
  }
}
