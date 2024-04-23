import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

import 'styles.dart';

class AppMarkdown extends StatelessWidget {
  const AppMarkdown(
    this.content, {
    super.key,
    this.onTapLink = const {},
  });

  final String content;
  final Map<String, VoidCallback> onTapLink;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Sizes.markdownWidth,
      child: Markdown(
        selectable: true,
        data: content,
        shrinkWrap: true,
        onTapLink: (text, url, title) async {
          final onTap = onTapLink[url];
          if (onTap != null) {
            onTap();
            return;
          }
          if (url != null) await launchUrl(Uri.parse(url));
        },
        styleSheet: MarkdownStyleSheet(
          a: const TextStyle(
            color: Colors.blue,
            decoration: TextDecoration.underline,
            decorationColor: Colors.blue,
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
            fontSize: FontSizes.markdown + 8,
            fontWeight: FontWeight.bold,
          ),
          h2: const TextStyle(
            fontSize: FontSizes.markdown + 6,
            fontWeight: FontWeight.bold,
          ),
          h3: const TextStyle(
            fontSize: FontSizes.markdown + 4,
            fontWeight: FontWeight.bold,
          ),
          h4: const TextStyle(
            fontSize: FontSizes.markdown + 2,
            fontWeight: FontWeight.bold,
          ),
          h5: const TextStyle(
            fontSize: FontSizes.markdown,
            fontWeight: FontWeight.bold,
          ),
          h6: const TextStyle(
            fontSize: FontSizes.markdown - 2,
            fontWeight: FontWeight.bold,
          ),
          p: const TextStyle(
            fontSize: FontSizes.markdown,
          ),
          tableBody: const TextStyle(
            fontSize: FontSizes.markdown,
          ),
          tableHead: const TextStyle(
            fontSize: FontSizes.markdown,
            fontWeight: FontWeight.bold,
          ),
          listBullet: const TextStyle(
            fontSize: FontSizes.markdown,
          ),
        ),
      ),
    );
  }
}
