import 'package:flutter/material.dart';

import '../constant.dart';

BoxShadow defaultShadow = BoxShadow(
  color: Get.isDarkMode
      ? Theme.of(Get.context!).colorScheme.primary.withOpacity(0)
      : Colors.black.withOpacity(0.05),
  blurRadius: 15,
  spreadRadius: 0.5,
  offset: const Offset(0, 0),
);

class BorderSize {
  static double circle = 10000;
  static double exLarge = 40;
  static double large = 30;
  static double medium = 20;
  static double small = 10;
  static double exSmall = 5;
  static double defaultSize = 20;
}

class Insets {
  // static double exLarge = Device.get().isPhone ? 40 : 50;
  // static double large = Device.get().isPhone ? 30 : 40;
  // static double medium = Device.get().isPhone ? 20 : 30;
  // static double small = Device.get().isPhone ? 10 : 20;
  // static double exSmall = Device.get().isPhone ? 5 : 10;
  static double exLarge = 40;
  static double large = 30;
  static double medium = 20;
  static double small = 10;
  static double exSmall = 5;
}
