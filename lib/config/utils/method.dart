import 'dart:io';

import 'package:Trip/config/constant.dart';
import 'package:flutter/material.dart';

Future<dynamic> customBottomSheet(BuildContext context, {Widget? child, double? height}) {
  return Get.bottomSheet(
    Container(
      width: context.width,
      constraints: BoxConstraints(
        maxHeight: height ?? context.height * 0.8,
        minHeight: context.height * 0.2,
      ),
      decoration: BoxDecoration(
        color: Get.isDarkMode ? context.theme.colorScheme.surface : context.theme.colorScheme.surface,
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
    enterBottomSheetDuration: Duration(milliseconds: 400),
    exitBottomSheetDuration: Duration(milliseconds: 400),
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
