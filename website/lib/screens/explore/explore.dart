import 'package:flutter/material.dart';
import 'package:hc_web/shared/bricks/utils.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../shared/bricks/markdown.dart';
import '../../shared/framework/screen.dart';
import '_items.dart';

final exploreScreen = AppScreen((_) => const _Screen());

class _Screen extends StatelessWidget {
  const _Screen();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _Title(),
        _Cards(),
      ],
    );
  }
}

class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    return const AppMarkdown('''
# Resources

We listed resources for emotional and social education.
Did we miss something?
''');
  }
}

class _Cards extends StatelessWidget {
  const _Cards();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(50),
      itemCount: items.length,
      itemBuilder: (ctx, i) => _Card(items[i]),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        mainAxisExtent: 264,
      ),
    );
  }
}

class _Card extends StatelessWidget {
  const _Card(this.item);

  final ExploreItem item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => launchUrl(Uri.parse(isWebOnIos ? item.iosLink : item.link)),
      child: Card(
        color: const Color.fromARGB(255, 171, 228, 255),
        child: Container(
          height: 290,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          padding: EdgeInsets.all(20),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Image.asset(item.image),
                  ),
                  SizedBox(height: 20),
                  Text(
                    item.title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(item.description, softWrap: true),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
