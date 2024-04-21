import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

import 'styles.dart';

class AppMarkdown extends StatelessWidget {
  const AppMarkdown(
    this.content, {
    super.key,
  });

  final String content;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: Sizes.markdownWidth,
        child: Markdown(
          selectable: true,
          data: content,
          onTapLink: (text, url, title) async {
            if (url != null) await launchUrl(Uri.parse(url));
          },
          styleSheet: MarkdownStyleSheet(
            a: const TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
            blockquote: const TextStyle(
              color: Colors.grey,
              fontStyle: FontStyle.italic,
            ),
            code: const TextStyle(
              backgroundColor: Colors.grey,
              color: Colors.white,
            ),
            h1: const TextStyle(
              fontSize: Sizes.markdownFont + 8,
              fontWeight: FontWeight.bold,
            ),
            h2: const TextStyle(
              fontSize: Sizes.markdownFont + 6,
              fontWeight: FontWeight.bold,
            ),
            h3: const TextStyle(
              fontSize: Sizes.markdownFont + 4,
              fontWeight: FontWeight.bold,
            ),
            h4: const TextStyle(
              fontSize: Sizes.markdownFont + 2,
              fontWeight: FontWeight.bold,
            ),
            h5: const TextStyle(
              fontSize: Sizes.markdownFont,
              fontWeight: FontWeight.bold,
            ),
            h6: const TextStyle(
              fontSize: Sizes.markdownFont - 2,
              fontWeight: FontWeight.bold,
            ),
            p: const TextStyle(
              fontSize: Sizes.markdownFont,
            ),
            tableBody: const TextStyle(
              fontSize: Sizes.markdownFont,
            ),
            tableHead: const TextStyle(
              fontSize: Sizes.markdownFont,
              fontWeight: FontWeight.bold,
            ),
            listBullet: const TextStyle(
              fontSize: Sizes.markdownFont,
            ),
          ),
        ),
      ),
    );
  }
}
