import 'package:flutter/material.dart';

import '../shared/markdown.dart';
import '../shared/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const teamLink = 'team';
    return AppMarkdown(
      '''
**Happy Creek** aims to provide **emotional and
social education** for elementary and middle
scroll children via a **role-playing computer game**.

We are in the phase of shaping the vision and roadmap.
**Read more** in the
[living doc](https://docs.google.com/document/d/1ZNrNoxZKZmkcF75ZyGUHrV3UPyJnhEjyVhh3ubYwXFM).

\v

[Our Team]($teamLink)

    ''',
      onTapLink: {
        teamLink: () => push(AppRoutes.team, context),
      },
    );
  }
}
