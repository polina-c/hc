import 'package:flutter/material.dart';

import '../shared/bricks/image.dart';
import '../shared/bricks/layout.dart';
import '../shared/bricks/text.dart';
import '../shared/framework/screen.dart';

final teamScreen = AppScreen((_) => const _Screen());

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
            const AppColumn(
              width: 400,
              child: AppMarkdown('''
# Our Team

The team is led by [Polina Cherkasova](https://polina-c.com), software engineer, creator of
[layerlens](https://pub.dev/packages/layerlens)
, member of [Flutter](https://flutter.dev/)
engineering team, mom of grown children,
participant of many psychological practices, programs and retreats.
                      '''),
            ),
            const SizedBox(width: 20),
            AppImage(280, 'images/team/team.jpg'),
          ],
        ),
        const AppColumn(
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
