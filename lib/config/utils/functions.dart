import 'dart:math';
import 'package:Trip/main.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tuple/tuple.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constant.dart';

String makeDate(DateTime? date) {
  return DateFormat('yyyy-MM-dd').format(date ?? DateTime.now());
}

String makeTime(DateTime? date) {
  return DateFormat('h:m a').format(date ?? DateTime.now());
}

String getStringOrDefault(String? inputString, [String defaultString = '-']) {
  if (inputString == null || inputString.isEmpty) {
    return defaultString;
  } else {
    return inputString;
  }
}

String formatCurrency(double amount) {
  final NumberFormat formatter = NumberFormat.decimalPattern('ar_IQ');
  return formatter.format(amount) + " IQ".tr;
}

Tuple3<String, Color, String> getStatus(int? status) {
  switch (status) {
    case 0:
      return Tuple3('مفتوح'.tr, Colors.blue, Assets.assetsIconsHourglassHigh);
    case 1:
      return Tuple3('معلق'.tr, Colors.orange, Assets.assetsIconsHourglassHigh);
    case 2:
      return Tuple3('تم الحل'.tr, Colors.green, Assets.assetsIconsChecks);
    case 3:
      return Tuple3('مغلق'.tr, Colors.red, Assets.assetsIconsX);
    default:
      return Tuple3('مفتوح'.tr, Colors.blue, Assets.assetsIconsHourglassHigh);
  }
}

Tuple3<String, Color, String> getStatusTask(int? status) {
  switch (status) {
    case 0:
      return Tuple3(
          'pending'.tr, Colors.orange, Assets.assetsIconsHourglassHigh);
    case 1:
      return Tuple3('Completed'.tr, Colors.blue, Assets.assetsIconsChecks);

    case 2:
      return Tuple3('Problem'.tr, Colors.red, Assets.assetsIconsX);
    case 3:
      return Tuple3('exceeded'.tr, Colors.red, Assets.assetsIconsX);
    default:
      return Tuple3(
          'pending'.tr, Colors.orange, Assets.assetsIconsHourglassHigh);
  }
}

Future<void> launchUrls(Uri url) async {
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

void changeTheme(bool isDark) {
  if (isDark == false) {
    prefs.setBool('darkTheme', false);
    Get.changeThemeMode(ThemeMode.light);
  } else {
    prefs.setBool('darkTheme', true);
    Get.changeThemeMode(ThemeMode.dark);
  }
}

int delayValue(int index, int perPage, int? timeOfIndex,
    {int? maxDelay = 1000}) {
  int delayMultiplier = timeOfIndex ?? 70;
  int maxDelays = maxDelay ?? 1000;

  int itemNumberInPage =
      index % perPage + 1; // Calculate item number within the page

  int delay = itemNumberInPage * delayMultiplier;

  // Cap the delay at the maximum value
  int cappedDelay = min(delay, maxDelays);
  // Logger().d("cappedDelay => $cappedDelay");
  return cappedDelay;
}

bool checkLocal() {
  return Get.locale!.languageCode == 'ar' ? true : false;
}

SnackbarController noti(title, body, {Function(GetSnackBar)? onTap}) {
  SnackbarController x = Get.snackbar(
    title,
    body,
    margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
    colorText: Theme.of(Get.context!).colorScheme.onBackground,
    icon: Icon(
      Icons.notifications,
      color: Theme.of(Get.context!).colorScheme.primary,
    ),
    backgroundColor: Theme.of(Get.context!).colorScheme.background,
    borderRadius: 10,
    boxShadows: [defaultShadow],
    onTap: onTap,
  );
  return x;
}
