import 'package:flutter/material.dart';
import 'package:hc_web/shared/bricks/fab.dart';
import 'package:hc_web/shared/bricks/layout.dart';
import 'package:hc_web/shared/framework/app_structure.dart';

import '../shared/bricks/border.dart';
import '../shared/bricks/image.dart';
import '../shared/bricks/text.dart';
import '../shared/design/styles.dart';
import '../shared/framework/screen.dart';

late final homeScreen = AppScreen((_) => const _Screen());

const _teamLink = 'team';

class _Screen extends StatelessWidget {
  const _Screen();

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _Text2(),
              AppImage(300, 'images/home/learning-kids-with-mother.png'),
            ],
          ),
          Row(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child:
                    AppImage(300, 'images/home/learning-kids-with-father.jpg'),
              ),
              _Text1(),
            ],
          ),
          SizedBox(height: 80),
          Fab(
            callback: () => push(AppRoutes.explore, context),
            label: 'Explore Resources',
          ),
        ],
      ),
    );
  }
}

class _Text1 extends StatelessWidget {
  const _Text1({super.key});

  @override
  Widget build(BuildContext context) {
    return AppColumn(
      child: AppMarkdown(
        '''
Grow up your children with skills to
communicate powerfully, to deal with emotions,
to navigate social situations and to feel safe
asking for help.

\v

[Our Team]($_teamLink) includes educators, psychologists,
designers, software engineers and parents.''',
        onTapLink: {
          _teamLink: () => push(AppRoutes.team, context),
        },
      ),
    );
  }
}

class _Text2 extends StatelessWidget {
  const _Text2({super.key});

  @override
  Widget build(BuildContext context) {
    return AppColumn(
      child: AppMarkdown('''
# Welcome to Happy Creek!

\v
We are connecting modern technologies and human wisdom
to enable **emotional and
social education** for more children.
                      '''),
    );
  }
}
