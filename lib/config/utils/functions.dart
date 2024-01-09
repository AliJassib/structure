import 'dart:math';

import 'package:Trip/config/interceptor/dio_interceptor.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

Future<T> fetchData<T>(
  String endpoint,
  Map<String, dynamic>? queryParameters,
  T Function(Map<String, dynamic>) fromJson,
) async {
  DioHttp dioHttp = Get.find();
  try {
    final response =
        await dioHttp.dio.get(endpoint, queryParameters: queryParameters);
    return fromJson(response.data);
  } catch (e) {
    Logger(level: Level.verbose).d(e.toString());
    throw e;
  }
}

// bool checkApi(int status, dynamic response) {
//   Logger().d(response);
//   Logger().d(status);

//   switch (status) {
//     case 401:
//       noti('Error'.tr, 'We Can\'t Found Your Account'.tr);
//       prefs.clear();
//       Get.offAll(() => const SplashPage());
//       break;
//     case 403:
//       noti('Error'.tr, 'You do not have permission to access this page'.tr);
//       break;
//     case 500:
//       noti('Error'.tr, 'Server Error'.tr);
//       break;
//     default:
//       if (response is Map && response.containsKey('message')) {
//         noti('Error'.tr, response['message']);
//         break;
//       } else {
//         noti('Error'.tr, 'Server Error'.tr);
//         break;
//       }
//   }

//   return false;
// }

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
    margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
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

List<String> generateNumberList(int number) {
  List<String> numberList = [];

  for (int i = 1; i <= number; i++) {
    numberList.add(i.toString());
  }

  return numberList;
}

width(context) {
  return MediaQuery.of(context).size.width;
}

height(context) {
  return MediaQuery.of(context).size.height;
}

primary(context) {
  return Theme.of(context).primaryColor;
}

checkDate(String dateTimes) {
  var dateStr = dateTimes;
  var dateParts = dateStr.split('/');

  var year = int.parse(dateParts[0]);
  var month = int.parse(dateParts[1]);
  var day = int.parse(dateParts[2]);

  if (day <= DateTime(year, month + 1).subtract(const Duration(days: 1)).day) {
    Logger().d('Valid date');
  } else {
    Logger().d('Invalid date');
  }
}
