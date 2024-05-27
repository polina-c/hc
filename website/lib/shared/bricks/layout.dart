import 'package:flutter/material.dart';

import '../design/styles.dart';

class AppColumn extends StatelessWidget {
  const AppColumn({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Sizes.columnWidth,
      child: child,
    );
  }
}
