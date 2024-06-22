import 'package:flutter/material.dart';

enum TextType { title, body, label }

class CustomText extends StatelessWidget {
  final String text;
  final TextType textType;
  final TextStyle? textStyle;
  final bool fontWeight;
  final double fontSize;
  final Color? color;
  final double height;
  final bool softWrap;
  final int maxLines;
  final TextAlign align;

  const CustomText({super.key, 
    required this.text,
    this.textType = TextType.body,
    this.textStyle,
    this.fontWeight = false,
    this.fontSize = 14.0,
    this.color,
    this.height = 0.0,
    this.softWrap = true,
    this.maxLines = 200,
    this.align = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle? selectedTextStyle;
    if (textType == TextType.title) {
      selectedTextStyle = TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: fontSize * 1.2,
        color: color?.withOpacity(0.8) ?? Theme.of(context).colorScheme.onBackground,
      );
    } else if (textType == TextType.label) {
      selectedTextStyle = TextStyle(
        fontSize: fontSize * 0.8,
        color: color ?? Theme.of(context).colorScheme.onBackground,
      );
    } else {
      selectedTextStyle = TextStyle(
        fontWeight: fontWeight ? FontWeight.bold : FontWeight.normal,
        fontSize: fontSize,
        color: color?.withOpacity(0.6) ?? Theme.of(context).colorScheme.onBackground,
        height: height,
      );
    }
    return Text(
      text,
      textAlign: align,
      softWrap: softWrap,
      maxLines: softWrap ? maxLines : 1,
      overflow: TextOverflow.ellipsis,
      style: selectedTextStyle,
    );
  }
}
