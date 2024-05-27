import 'package:flutter/material.dart';
import 'package:hc_web/shared/bricks/border.dart';
import 'package:hc_web/shared/design/styles.dart';
import 'package:url_launcher/url_launcher.dart';

import '../design/theme.dart';

class AppCard extends StatelessWidget {
  const AppCard({required this.child, this.link});

  final Widget child;
  final Uri? link;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => link == null ? null : launchUrl(link!),
      child: Card(
        shape: borderedShape,
        color: AppColors.card,
        child: child,
      ),
    );
  }
}
