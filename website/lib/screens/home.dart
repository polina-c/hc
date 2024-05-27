import 'package:flutter/material.dart';
import 'package:hc_web/shared/bricks/fab.dart';
import 'package:hc_web/shared/bricks/layout.dart';
import 'package:hc_web/shared/framework/app_structure.dart';

import '../shared/bricks/text.dart';
import '../shared/framework/screen.dart';

late final homeScreen = AppScreen((_) => const _Screen());

class _Screen extends StatelessWidget {
  const _Screen();

  @override
  Widget build(BuildContext context) {
    return AppColumn(
      child: Column(
        children: [
          _Text(),
          Fab(
            callback: () => push(AppRoutes.explore, context),
            label: 'Explore',
          ),
        ],
      ),
    );
  }
}

class _Text extends StatelessWidget {
  const _Text({super.key});

  @override
  Widget build(BuildContext context) {
    const teamLink = 'team';
    return AppMarkdown(
      '''
# Welcome to Happy Creek!

\v

We are connecting modern technologies and human wisdom
to enable **emotional and
social education** for more children.

We want more children to grow up with skills to
communicate powerfully, to deal with emotions,
to navigate social situations and to feel safe to
ask for help when they need it.

[Our Team]($teamLink) includes educators, psychologists,
designers, software engineers and parents.

\v
        ''',
      onTapLink: {
        teamLink: () => push(AppRoutes.team, context),
      },
    );
  }
}
