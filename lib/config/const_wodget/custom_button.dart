
import 'package:Trip/config/constant.dart';
import 'package:flutter/material.dart';

class CustomLoadingText extends StatelessWidget {
  final Color? buttonColor;

  const CustomLoadingText({
    super.key,
    this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      curve: Curves.easeInOut,
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(milliseconds: 700),
      builder: (BuildContext context, double value, Widget? child) {
        return Opacity(opacity: value, child: child);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              color: context.theme.colorScheme.primary,
              strokeWidth: 3,
            ),
          ),
          const SizedBox(width: 10),
          Text('Loading'.tr,
              style: context.textTheme.bodyMedium!
                  .copyWith(color: Theme.of(context).colorScheme.primary)),
        ],
      ),
    );
  }
}
