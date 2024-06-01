import 'package:flutter/material.dart';

import '../design/theme.dart';

class AppTabBar extends StatelessWidget {
  const AppTabBar(
      {super.key, required this.controller, required this.tabs, this.onTap});

  final TabController controller;
  final List<Widget> tabs;
  final void Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: controller,
      labelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColors.text,
          fontSize: FontSizes.body),
      unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
      dividerColor: AppColors.divider,
      indicatorWeight: 4,
      tabs: tabs,
      tabAlignment: TabAlignment.center,
      onTap: onTap,
    );
  }
}
