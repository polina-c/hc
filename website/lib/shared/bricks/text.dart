import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

import '../design/styles.dart';

class AppText extends StatelessWidget {
  const AppText(this.text, {super.key, this.textAlign, this.style});

  final String text;
  final TextAlign? textAlign;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ?? AppTextStyles.normal(context),
      textAlign: textAlign,
      softWrap: true,
      overflow: TextOverflow.visible,
    );
  }
}

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
    return Markdown(
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
      styleSheet: markdownStyleSheet,
    );
  }
}
