import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hc_web/shared/design/theme.dart';

import '../bricks/tab_bar.dart';
import '../bricks/text.dart';
import '../bricks/utils.dart';
import '../design/border.dart';
import 'app_structure.dart';
import 'screen.dart';
import '../design/styles.dart';

const _version = 9;

class AppScaffold extends StatefulWidget {
  const AppScaffold(
    this.route,
    this.screen, {
    super.key,
  });

  final AppScreen screen;
  final String route;

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold>
    with TickerProviderStateMixin {
  late TabController _menuTabController;
  late TabController _titleTabController;

  @override
  void initState() {
    super.initState();
    _titleTabController = TabController(length: 1, vsync: this);

    _menuTabController = TabController(length: appMenu.length, vsync: this);
    _menuTabController.index =
        appMenu.indexWhere((e) => e.route == widget.route);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return new DefaultTextStyle(
      style: new TextStyle(
        inherit: true,
        fontSize: FontSizes.body,
        color: AppColors.text,
      ),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 140,

          title: Column(
            children: [
              Underlined(
                child: Row(
                  children: [
                    Expanded(
                      child: AppTabBar(
                        showDivider: false,
                        controller: _titleTabController,
                        showIndicator: false,
                        textStyle: AppTextStyles.title(context),
                        tabs: [
                          Tab(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ImageIcon(
                                  AssetImage('assets/images/logo_flipped.png'),
                                  color: AppColors.logo,
                                ),
                                const SizedBox(width: 8),
                                Text('Happy Creek'),
                              ],
                            ),
                          ),
                        ],
                        onTap: (_) => push(AppRoutes.home, context),
                      ),
                    ),
                    AppTabBar(
                      showDivider: false,
                      controller: _menuTabController,
                      tabs: appMenu.map((e) => Tab(text: e.label)).toList(),
                      onTap: (i) {
                        final route = appMenu[i].route;
                        push(route, context);
                      },
                    ),
                    // if (hamburger)
                    //   _Hamburger(widget.route)
                    // else
                    //   _Menu(widget.route),
                  ],
                ),
              ),
              SizedBox(height: 10),
              AppText(
                'Screen toys to foster emotional and social skills.',
                style: AppTextStyles.subLine(context),
              ),
            ],
          ),
          centerTitle: false,
          automaticallyImplyLeading: false, // Remove back button
          backgroundColor: AppColors.background,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                widget.screen.content(context),
                const SizedBox(height: Sizes.paddingAfterBody),
                Image.asset('${imagePath}images/ds.png'),
                Text('${defaultTargetPlatform.name}, $_version'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class _Menu extends StatelessWidget {
//   const _Menu(this.route);

//   final String route;

//   @override
//   Widget build(BuildContext context) {
//     return Wrap(
//       children: appMenu.entries
//           .map(
//             (e) => _MenuItem(
//               route: e.key,
//               selected: route,
//               displayName: e.value,
//             ),
//           )
//           .toList(),
//     );
//   }
// }

// class _Hamburger extends StatelessWidget {
//   const _Hamburger(this.route);

//   final String route;

//   @override
//   Widget build(BuildContext context) {
//     return PopupMenuButton<String>(
//       icon: Icon(Icons.more_vert),
//       itemBuilder: (BuildContext context) {
//         return appMenu.entries.map((e) {
//           return PopupMenuItem<String>(
//             value: 'menuItem',
//             child: _MenuItem(
//               route: e.key,
//               selected: route,
//               displayName: e.value,
//             ),
//           );
//         }).toList();
//       },
//     );
//   }
// }

class _MenuItem extends StatelessWidget {
  const _MenuItem({
    required this.route,
    required this.selected,
    required this.displayName,
  });

  final String route;
  final String selected;
  final String displayName;

  bool get _isSelected => route == selected;

  @override
  Widget build(BuildContext context) {
    return _AppBarItem(
      onPressed: _isSelected ? null : () => push(route, context),
      type: _isSelected ? AppBarTypes.menuSelected : AppBarTypes.menuClickable,
      text: displayName,
    );
  }
}

class _AppBarItem extends StatelessWidget {
  const _AppBarItem({this.onPressed, required this.text, required this.type});

  final VoidCallback? onPressed;
  final AppBarTypes type;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyles.appBarItem(context, type),
      child: Text(text),
    );
  }
}
