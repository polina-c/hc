import 'package:flutter/material.dart';

import '../shared/bricks/text.dart';
import '../shared/framework/screen.dart';

final teamScreen = AppScreen((_) => const _Screen());

class _Screen extends StatelessWidget {
  const _Screen();

  @override
  Widget build(BuildContext context) {
    // `\v` adds vertical space
    return const AppMarkdown('''

# Our Team

\v

The team is led by [Polina Cherkasova](https://twitter.com/PolinaCC), software engineer, creator of
[layerlens](https://pub.dev/packages/layerlens)
, member of [Flutter](https://flutter.dev/)
engineering team, mom of grown children,
participant of many psychological practices, programs and retreats.

\v

## Contributors
- Jessi Back, mom, student of NWIC
- [Maria Nefedeva](https://www.marianefedyeva.com/), UX designer, mom
- [Mish Cherkasov](https://www.instagram.com/mish.cherkasov), visual content consultant

and others who prefer to stay anonymous
''');
  }
}
