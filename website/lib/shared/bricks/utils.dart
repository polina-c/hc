import 'package:flutter/foundation.dart';

late final bool isWebOnIos = () {
  if (!kIsWeb) return false;

  return {TargetPlatform.iOS, TargetPlatform.macOS}
      .contains(defaultTargetPlatform);
}();
