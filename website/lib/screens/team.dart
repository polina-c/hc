import 'package:flutter/material.dart';
import 'package:hc_web/shared/bricks/layout.dart';

import '../shared/bricks/image.dart';
import '../shared/bricks/text.dart';
import '../shared/framework/screen.dart';

final teamScreen = AppScreen((_) => const _Screen());

class _Screen extends StatelessWidget {
  const _Screen();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppColumn(
              width: 400,
              child: AppMarkdown('''
# Our Team

The team is led by [Polina Cherkasova](https://twitter.com/PolinaCC), software engineer, creator of
[layerlens](https://pub.dev/packages/layerlens)
, member of [Flutter](https://flutter.dev/)
engineering team, mom of grown children,
participant of many psychological practices, programs and retreats.
                      '''),
            ),
            SizedBox(width: 20),
            AppImage(280, 'images/team/team.jpg'),
          ],
        ),
        AppColumn(
          child: AppMarkdown(
            '''
## Contributors
- Jessi Back, mom, student of NWIC
- [Maria Nefedeva](https://www.marianefedyeva.com/), UX designer, mom
- [Mish Cherkasov](https://www.instagram.com/mish.cherkasov), visual content consultant

and others who prefer to stay anonymous
''',
          ),
        ),
      ],
    );
  }
}
