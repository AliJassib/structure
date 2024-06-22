// ignore_for_file: file_names

import 'package:Trip/config/constant.dart';
import 'package:flutter/material.dart';

class InkMe extends StatefulWidget {
  const InkMe({
    super.key,
    required this.child,
    this.onTap,
    this.radius,
    this.overlayColor,
    this.padding,
    this.onLongPress,
  });

  final Widget child;
  final BorderRadius? radius;
  final GestureTapCallback? onTap;
  final GestureTapCallback? onLongPress;
  final MaterialStateProperty<Color?>? overlayColor;
  final double? padding;

  @override
  State<InkMe> createState() => _InkMeState();
}

class _InkMeState extends State<InkMe> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        widget.child,
        Positioned.fill(
          child: Padding(
            padding: EdgeInsets.all(widget.padding ?? 0),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onLongPress: widget.onLongPress,
                borderRadius:
                    widget.radius ?? BorderRadius.circular(BorderSize.large),
                overlayColor: widget.overlayColor ??
                    MaterialStatePropertyAll(
                        context.theme.colorScheme.primary.withOpacity(0.1)),
                onTap: widget.onTap,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
