import 'package:flutter/material.dart';

import '../shared/markdown.dart';
import '../shared/routes.dart';

final teamScreen = AppScreen((_) => const _Screen());

class _Screen extends StatelessWidget {
  const _Screen();

  @override
  Widget build(BuildContext context) {
    // `\v` adds vertical space
    return const AppMarkdown('''
The team is led by [Polina Cherkasova](https://twitter.com/PolinaCC), software engineer, creator of
[layerlens](https://pub.dev/packages/layerlens)
, member of [Flutter](https://flutter.dev/)
engineering team, mom of grown children,
participant of many psychological practices, programs and retreats.

\v

**Contributors:**
- [Maria Nefedeva](https://www.marianefedyeva.com/), UX designer, mom
- [Mish Cherkasov](https://www.instagram.com/mish.cherkasov), visual content consultant
''');
  }
}
