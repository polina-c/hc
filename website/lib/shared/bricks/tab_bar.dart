import 'package:flutter/material.dart';

import '../design/theme.dart';

class AppTabBar extends StatelessWidget {
  const AppTabBar({
    super.key,
    required this.controller,
    required this.tabs,
    this.onTap,
    this.showIndicator = true,
    this.fontSize = FontSizes.body,
    this.showDivider = true,
  });

  final TabController? controller;
  final List<Widget> tabs;
  final void Function(int)? onTap;
  final bool showIndicator;
  final bool showDivider;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: controller,
      labelStyle: TextStyle(
        fontWeight: FontWeight.bold,
        color: AppColors.text,
        fontSize: fontSize,
      ),
      unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
      dividerColor: showDivider ? AppColors.divider : AppColors.background,
      indicatorWeight: 4,
      indicatorColor: showIndicator ? AppColors.primary : AppColors.background,
      tabs: tabs,
      tabAlignment: TabAlignment.center,
      onTap: onTap,
    );
  }
}
