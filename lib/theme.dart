import 'package:flutter/material.dart';

final pageTransitionsTheme = PageTransitionsTheme(
  builders: <TargetPlatform, PageTransitionsBuilder>{
    TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
    TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    // TargetPlatform.linux: NoAnimationPageTransitionsBuilder(),
    // TargetPlatform.macOS: NoAnimationPageTransitionsBuilder(),
    // TargetPlatform.windows: NoAnimationPageTransitionsBuilder(),
  },
);
