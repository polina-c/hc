Copied from https://github.com/bdero/flutter-scene-example

# Impeller Scene 3D Demo

This demo was featured as part of Flutter Forward 2023! Watch the keynote here:
[![Flutter Forward Thumbnail](https://img.youtube.com/vi/zKQYGKAe5W8/0.jpg)](https://www.youtube.com/watch?v=zKQYGKAe5W8&t=7074s "Flutter Forward 2023")

## ⚠️ Experimental! ⚠️

* This demo requires Impeller, which currently only supports iOS/iOS simulators.
* The [flutter_scene](https://pub.dev/packages/flutter_scene) package does not work out of the box and currently requires a special custom build of Flutter Engine to use (gn arg `--enable-impeller-3d`).
* The underlying Flutter API used to build and render Scene nodes is _not_ supported and _will_ break repeatedly. Eventually, the API will be removed/replaced altogether.

https://user-images.githubusercontent.com/919017/215621872-ef3dac49-22a0-476e-8fb9-d560121a3c17.mov

## Steps to build

Configure environment for [engine](https://github.com/flutter/flutter/wiki/Setting-up-the-Engine-development-environment) and [flutter](https://github.com/flutter/flutter).

Then follow steps below.
They are created by adding --enable-impeller-3d to gn in  https://github.com/flutter/flutter/wiki/Compiling-the-engine#compiling-for-ios-from-macos


In engine\src, nongooglers remove --goma and -j200:
0. glogin
1. git pull upstream main (in src/flutter)
2. gclient sync
3. ./flutter/tools/gn --ios --simulator --unoptimized --enable-impeller-3d --simulator-cpu=arm64 --goma
    Remove simulator for real device
    --simulator-cpu=arm64 argument us for an arm64 Mac simulator to output to out/ios_debug_sim_unopt_arm64
4. ./flutter/tools/gn --unoptimized --mac-cpu arm64 --goma --enable-impeller-3d
5. ninja -C out/ios_debug_sim_unopt_arm64 -j200 && ninja -C out/host_debug_unopt_arm64 -j200
   use out/host_debug_unopt_arm64  for real device

Then run flutter command:
flutter run -d A28FBDE3-BF32-4345-8E3F-5F546FA60AE5 --local-engine=ios_debug_sim_unopt_arm64 --local-engine-host=host_debug_unopt_arm64

Run `flutter devices` to get device id.
Your 'engine' should be peer to flutter for this to work.

This helps to troubleshoot simulator: https://stackoverflow.com/questions/77261779/ios-simulator-problem-failed-to-launch-ios-simulator-error-emulator-didnt-co

This can help with scenec: https://discord.com/channels/608014603317936148/1173336353187041380/1229155174056988794
