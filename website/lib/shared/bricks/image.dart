import 'package:flutter/material.dart';
import 'package:hc_web/shared/bricks/border.dart';

import 'utils.dart';

class AppImage extends StatelessWidget {
  const AppImage(this.width, this.path);

  final double width;
  final String path;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Bordered(
        child: Image.asset(
          '${imagePath}$path',
        ),
      ),
    );
  }
}
