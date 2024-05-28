import 'package:flutter/material.dart';
import 'package:hc_web/shared/bricks/fab.dart';
import 'package:hc_web/shared/bricks/layout.dart';
import 'package:hc_web/shared/framework/app_structure.dart';

import '../shared/bricks/image.dart';
import '../shared/bricks/text.dart';
import '../shared/framework/screen.dart';

late final homeScreen = AppScreen((_) => const _Screen());

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
            _Text1(),
            AppImage(300, 'images/home/learning-kids-with-mother.png'),
          ],
        ),
        SizedBox(height: 20),
        Wrap(
          alignment: WrapAlignment.center,
          children: [
            AppImage(300, 'images/home/learning-kids-with-father.jpg'),
            _Text2(),
          ],
        ),
        SizedBox(height: 30),
        Fab(
          callback: () => push(AppRoutes.explore, context),
          label: 'Explore Tools',
        ),
      ],
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

class _Text1 extends StatelessWidget {
  const _Text1();

  @override
  Widget build(BuildContext context) {
    return AppColumn(
      child: AppMarkdown('''
# Welcome to Happy Creek!

\v

We are connecting modern **technologies** and human **wisdom**
to enable **emotional and
social education** for more children.
                      '''),
    );
  }
}
