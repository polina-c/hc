import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../shared/bricks/markdown.dart';
import '../shared/framework/screen.dart';

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
# Explore

We listed educational resources for emotional and social skills.

''');
  }
}

class _Cards extends StatelessWidget {
  const _Cards();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(20),
      itemCount: _items.length,
      itemBuilder: (ctx, i) => _Card(_items[i]),
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

final _items = [
  _Item(
    title: 'Mira and Gosha',
    description:
        'Short animations, created by psychologists, where characters face challenges and overcome them.'
        '\nIn Russian, with translation.',
    image: 'images/explore/mira_gosha.png',
    link: 'https://www.youtube.com/@miragosha',
  ),
  _Item(
    title: 'About Mira and Gosha',
    description:
        'Short animations, created by psychologists. In Russian, with translation.',
    image: 'images/explore/mira_gosha.png',
    link: 'https://www.youtube.com/@miragosha',
  ),
  _Item(
    title: 'About Mira and Gosha',
    description:
        'Short animations, created by psychologists. In Russian, with translation.',
    image: 'images/explore/mira_gosha.png',
    link: 'https://www.youtube.com/@miragosha',
  ),
  _Item(
    title: 'About Mira and Gosha',
    description:
        'Short animations, created by psychologists. In Russian, with translation.',
    image: 'images/explore/mira_gosha.png',
    link: 'https://www.youtube.com/@miragosha',
  ),
];

class _Item {
  const _Item({
    required this.title,
    required this.description,
    required this.image,
    required this.link,
  });

  final String title;
  final String description;
  final String image;
  final String link;
}

class _Card extends StatelessWidget {
  const _Card(this.item);

  final _Item item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => launchUrl(Uri.parse(item.link)),
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
