import 'package:flutter/material.dart';
import 'package:hc_web/shared/design/theme.dart';

final borderedShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(18.0),
  side: BorderSide(
    color: AppColors.border,
    width: Sizes.border,
  ),
);

class Bordered extends StatelessWidget {
  const Bordered({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border, width: Sizes.border),
      ),
      child: child,
    );
  }
}
