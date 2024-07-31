import 'package:flutter/material.dart';

import '../shared/bricks/fab.dart';
import '../shared/bricks/image.dart';
import '../shared/bricks/layout.dart';
import '../shared/bricks/text.dart';
import '../shared/framework/app_structure.dart';
import '../shared/framework/screen.dart';

final homeScreen = AppScreen((_) => const _Screen());

const _teamLink = 'team';

class _Screen extends StatelessWidget {
  const _Screen();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Wrap(
          alignment: WrapAlignment.center,
          children: [
            const _Text1(),
            AppImage(300, 'images/home/learning-kids-with-mother.png'),
          ],
        ),
        const SizedBox(height: 20),
        Wrap(
          alignment: WrapAlignment.center,
          children: [
            AppImage(300, 'images/home/learning-kids-with-father.jpg'),
            const _Text2(),
          ],
        ),
        const SizedBox(height: 30),
        Fab(
          callback: () => push(AppRoutes.toys, context),
          label: 'Explore Toys',
        ),
      ],
    );
  }
}

class _Text1 extends StatelessWidget {
  const _Text1();

  @override
  Widget build(BuildContext context) {
    return const AppColumn(
      child: AppMarkdown('''
# Welcome to Happy Creek!

\v

A collection of games, movies and tools designed to create
**quality playtime**.
They aim to foster **learning, emotional development,
and social growth** in a fun and engaging manner.
'''),
    );
  }
}

class _Text2 extends StatelessWidget {
  const _Text2();

  @override
  Widget build(BuildContext context) {
    return AppColumn(
      child: AppMarkdown(
        '''
Grow up your children with skills to
**communicate** powerfully, to **deal** with emotions,
to **navigate** social situations, to feel **freedom**
thinking differently and to **feel safe**
asking for help.

&nbsp;

[Our Team]($_teamLink) includes educators, psychologists,
designers, software engineers and parents.''',
        onTapLink: {
          _teamLink: () => push(AppRoutes.team, context),
        },
      ),
    );
  }
}
