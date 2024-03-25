// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'package:Trip/main.dart';
import 'package:Trip/pages/splash/splash_page.dart';
import 'package:dio/dio.dart';
import 'package:Trip/config/constant.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class DioHttp extends GetxController {
  Dio dio = Dio();
  static const String baseUrls = 'http://95.179.133.4:3365/api/v1/';

  @override
  void onInit() {
    super.onInit();
    configureDio();
  }

  void configureDio() {
    dio
      ..options.baseUrl = baseUrls
      ..options.connectTimeout = const Duration(seconds: 120)
      ..options.receiveTimeout = const Duration(seconds: 120)
      ..options.contentType = 'application/json; charset=utf-8'
      ..options.headers = {"accept": "*/*", "Content-Type": "application/json"};

    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      options.headers.addAll({
        HttpHeaders.authorizationHeader: "Bearer ${prefs.getString('token')}",
      });
      Logger()
          .d('${options.queryParameters}\n ${options.path} \n ${options.data}');

      return handler.next(options); //continue
    }, onResponse: (response, handler) async {
      handleResponse(response);

      return handler.next(response);
    }, onError: (DioError e, handler) async {
      handleError(e);

      return handler.next(e); //continue
    }));
  }

  void handleResponse(response) {
    try {
      final resultToken = response.data['result']['token'];
      if (resultToken != null) {
        prefs.setString('token', resultToken);
        Logger().d(resultToken);
      }
    } catch (e) {}
    if (response.statusCode == 401) {
      handleUnauthorized();
    }
  }

  void handleError(DioError e) {
    if (e.message?.contains('The request connection took longer') == true) {
      noti('Check Your Network Connections'.tr, e.message);
    }
    if (e.response?.statusCode == 401) {
      handleUnauthorized();
    } else if (e.response?.statusCode == 400) {
      handleBadRequest(e);
    } else {
      noti('Error'.tr, e.response!.data['message'].toString());

      Logger().d(e.response?.statusCode);
      Logger().d(e.response?.data);
    }
  }

  void handleUnauthorized() async {
    Get.offAll(const SplashPage());
    prefs.remove('token');
    prefs.remove('role');
    OneSignal.shared.removeExternalUserId();
  }

  void handleBadRequest(DioError e) {
    try {
      final errorMessage =
          e.response!.data['message'] ?? e.response!.data['errors'].toString();
      noti('Error'.tr, errorMessage);
    } catch (s) {
      noti('Error'.tr, e.response!.data);
    }
    Logger().e(e.response?.data);
  }
}
