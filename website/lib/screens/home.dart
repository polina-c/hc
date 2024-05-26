import 'package:flutter/material.dart';
import 'package:hc_web/shared/framework/app_structure.dart';
import 'package:url_launcher/url_launcher.dart';

import '../shared/bricks/markdown.dart';
import '../shared/framework/screen.dart';

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
    return Column(
      children: [
        SizedBox(
          height: 800,
        ),
        AppMarkdown(
          '''
# Emotional and Social Education for Children

\v

Welcome to Happy Creek!

We are connecting modern technologies and human wisdom
to enable **emotional and
social education** for more children.

We are in the phase of prototyping.

Your thoughts and suggestions are welcomed.

\v

[Our Team]($teamLink)
        ''',
          onTapLink: {
            teamLink: () => push(AppRoutes.team, context),
          },
        ),
      ],
    );
  }
}
