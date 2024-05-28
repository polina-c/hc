import 'package:flutter/material.dart';
import 'package:hc_web/shared/bricks/text.dart';
import 'package:url_launcher/url_launcher.dart';

import '../design/styles.dart';

class ShareFab extends StatelessWidget {
  const ShareFab({super.key});

  @override
  Widget build(BuildContext context) {
    return Fab(
      question: 'Did we miss something?\nDo you have new tool ideas? feedback?',
      label: 'Share',
      callback: () => launchUrl(
        Uri.parse('https://forms.gle/GVBRUABAPEHpEQj97'),
      ),
    );
  }
}

/// A floating action button.
class Fab extends StatelessWidget {
  const Fab({
    super.key,
    required this.callback,
    required this.label,
    this.question,
  });

  final VoidCallback callback;
  final String label;
  final String? question;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (question != null) ...[
            AppText(question!),
            SizedBox(
              width: 20,
            ),
          ],
          FilledButton(
            style: ButtonStyles.fab(context),
            onPressed: callback,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                label,
                style: TextStyles.activeMenu(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
