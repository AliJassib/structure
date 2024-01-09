import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';

class CustomFade extends StatelessWidget {
  final double height;
  final double width;
  final double radius;
  final Color? color;
  const CustomFade({
    super.key,
    required this.height,
    required this.width,
    required this.radius,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return FadeShimmer(
      millisecondsDelay: 300,
      height: height,
      width: width,
      radius: radius,
      baseColor: color?.withOpacity(0.6) ?? Colors.grey.withOpacity(0.8),
      highlightColor: color?.withOpacity(0.1) ?? Colors.grey.withOpacity(0.1),
    );
  }
}
