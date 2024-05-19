import 'package:flutter/material.dart';

import '../shared/bricks/markdown.dart';
import '../shared/framework/screen.dart';

final exploreScreen = AppScreen((_) => const _Screen());

class _Screen extends StatelessWidget {
  const _Screen();

  @override
  Widget build(BuildContext context) {
    // `\v` adds vertical space
    return const AppMarkdown('''

# Explore


''');
  }
}
