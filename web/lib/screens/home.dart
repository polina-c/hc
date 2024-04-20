import 'package:flutter/material.dart';

import '../shared/markdown.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppMarkdown('''
Happy Creek aims to provide emotional and social education for elementary and middle scroll children via a role-playing computer game.

We are in the phase of shaping the vision and roadmap of the project. Read more in the living doc.

    ''');
  }
}
