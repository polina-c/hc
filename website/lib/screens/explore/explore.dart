import 'package:flutter/material.dart';
import 'package:hc_web/shared/bricks/fab.dart';
import 'package:hc_web/shared/bricks/utils.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../shared/bricks/layout.dart';
import '../../shared/bricks/text.dart';
import '../../shared/framework/screen.dart';
import '_items.dart';

final exploreScreen = AppScreen((_) => const _Screen());

class _Screen extends StatelessWidget {
  const _Screen();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppColumn(
          child: Column(
            children: const [
              _Text(),
              ShareFab(),
            ],
          ),
        ),
        _Cards(),
      ],
    );
  }
}

class _Text extends StatelessWidget {
  const _Text();

  @override
  Widget build(BuildContext context) {
    return const AppMarkdown('''
# Explore

We listed some educational resources. Choose what you like and what works for you.


'''); // Button 'let us know'
  }
}

class _Cards extends StatelessWidget {
  const _Cards();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      // Is needed for mobile browsers, to scroll with tap and drag.
      physics: NeverScrollableScrollPhysics(),
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
      ),
    );
  }
}
