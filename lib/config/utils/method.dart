import 'dart:io';

import 'package:Trip/config/constant.dart';
import 'package:Trip/config/utils/dialog.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Future<dynamic> customBottomSheet(BuildContext context,
    {Widget? child, double? height}) {
  return Get.bottomSheet(
    Container(
      width: context.width,
      constraints: BoxConstraints(
        maxHeight: height ?? context.height * 0.8,
        minHeight: context.height * 0.2,
      ),
      decoration: BoxDecoration(
        color: Get.isDarkMode
            ? context.theme.colorScheme.surface
            : context.theme.colorScheme.surface,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Insets.medium),
          topRight: Radius.circular(Insets.medium),
        ),
      ),
      child: Column(
        children: [
          Gap(Insets.small),
          Container(
            width: context.width * 0.2,
            height: Insets.exSmall,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Insets.medium),
              color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
            ),
          ),
          child ?? Gap(Insets.small),
        ],
      ),
    ),
    enterBottomSheetDuration: const Duration(milliseconds: 400),
    exitBottomSheetDuration: const Duration(milliseconds: 400),
    isScrollControlled: true,
  );
}

Future<dynamic> customDialog(BuildContext context,
    {String? title,
    Widget? content,
    String? textConfirm,
    String? textCancel,
    Color? confirmTextColor,
    Color? buttonColor,
    Color? cancelTextColor,
    Function()? onConfirm,
    Function()? onCancel}) {
  return Get.defaultDialog(
      title: title ?? '-',
      content: content ?? const Text('-'),
      textConfirm: textConfirm ?? 'Yes'.tr,
      textCancel: textCancel ?? 'No'.tr,
      confirmTextColor: confirmTextColor,
      buttonColor: buttonColor,
      cancelTextColor: cancelTextColor,
      onConfirm: onConfirm);
}

Future getDialog({
  required BuildContext context,
  required Widget child,
}) {
  return showAnimatedDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        titlePadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Insets.medium),
        ),
        title: child,
      );
    },
    animationType: DialogTransitionType.slideFromBottom,
    curve: Curves.fastLinearToSlowEaseIn,
    duration: const Duration(milliseconds: 700),
  );
}

Future<bool> showExitPopup(context) async {
  return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("هل تريد الخروج من التطبيق؟".tr),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Logger().d('yes selected');
                          exit(0);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red.shade800),
                        child: Text("نعم".tr),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {
                        Logger().d('no selected');
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      child: Text("كلا".tr,
                          style: const TextStyle(color: Colors.black)),
                    ))
                  ],
                )
              ],
            ),
          ),
        );
      });
}

NumberFormat price() {
  return NumberFormat.currency(
      locale: 'ar', symbol: ' IQD'.tr, decimalDigits: 0);
}

AppBar customAppBar(BuildContext context, {String? title}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    title: Text(
      title ?? 'ارسال شكوى'.tr,
      style: context.theme.textTheme.titleSmall!.copyWith(
        fontWeight: FontWeight.bold,
      ),
    ),
    centerTitle: false,
    leading: InkMe(
      onTap: () {
        Get.back();
      },
      child: Container(
        width: Insets.exLarge,
        height: Insets.exLarge,
        margin: EdgeInsets.all(Insets.exSmall),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.7),
          shape: BoxShape.circle,
        ),
        child: const Center(
          child: Icon(CupertinoIcons.back, color: Colors.black),
        ),
      ),
    ),
  );
}
