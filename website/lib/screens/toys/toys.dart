import 'package:flutter/material.dart';
import 'package:hc_web/shared/bricks/fab.dart';
import 'package:hc_web/shared/bricks/utils.dart';
import 'package:hc_web/shared/design/theme.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../shared/bricks/card.dart';
import '../../shared/bricks/layout.dart';
import '../../shared/bricks/tab_bar.dart';
import '../../shared/bricks/text.dart';
import '../../shared/framework/screen.dart';
import '_items.dart';

final toysScreen = AppScreen((_) => const _Screen());

class _Screen extends StatelessWidget {
  const _Screen();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppColumn(
          width: 500,
          child: Column(
            children: const [
              _Text(),
              SizedBox(height: 20),
              ShareFab(),
            ],
          ),
        ),
        SizedBox(height: 40),
        _Cards(),
      ],
    );
  }
}

class ShareFab extends StatelessWidget {
  const ShareFab({super.key});

  @override
  Widget build(BuildContext context) {
    return Fab(
      question:
          'Did something work great for you?\nDid we miss something?\nDo you have new toy idea? feedback?',
      label: 'Share',
      callback: () => launchUrl(
        Uri.parse('https://forms.gle/GVBRUABAPEHpEQj97'),
      ),
    );
  }
}

class _Text extends StatelessWidget {
  const _Text();

  @override
  Widget build(BuildContext context) {
    return const AppMarkdown('''
# Explore Toys

Here we listed games, movies and tools, which aim to foster
emotional and social skills through
engaging and interactive activities.

Choose what you like and what works for you.
''');
  }
}

class _Cards extends StatefulWidget {
  const _Cards();

  @override
  State<_Cards> createState() => _CardsState();
}

class _CardsState extends State<_Cards> with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: ToyTypes.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final tabBar = new AppTabBar(
      indicatorColor: AppColors.tabSecondary,
      controller: _controller,
      onTap: (value) => setState(() {}),
      tabs: ToyTypes.values.map((t) => Tab(text: t.name)).toList(),
    );

    final type = ToyTypes.values[_controller.index];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          SizedBox(height: 50, child: tabBar),
          SizedBox(height: 40),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: items
                .where((i) => i.type == type)
                .map((i) => _Card(i))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _Card extends StatelessWidget {
  const _Card(this.item);

  final Toy item;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      link: Uri.parse(isWebOnIos ? item.iosLink : item.link),
      child: Container(
        height: 290,
        width: 500,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: FittedBox(
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.asset(
                    '$imagePath${item.image}',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
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
      ),
    );
  }
}
