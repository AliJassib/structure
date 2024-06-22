// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'package:Trip/main.dart';
import 'package:Trip/pages/splash/splash_page.dart';
import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:Trip/config/constant.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class DioHttp extends GetxController {
  Dio dio = Dio();
  static const String baseUrls = 'http://164.92.197.198:6663/api';

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
    dio.interceptors.add(
      AwesomeDioInterceptor(),
    );

    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      String? token = prefs.getString('token');
      if (token == null) {
        options.headers.addAll({
          HttpHeaders.authorizationHeader:
              "Bearer ${prefs.getString('verifyToken')}",
        });
      } else {
        options.headers.addAll({
          HttpHeaders.authorizationHeader: "Bearer $token",
        });
        prefs.remove('verifyToken');
      }

      // Logger()
      //     .d('${options.queryParameters}\n ${options.path} \n ${options.data}');

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
      final resultToken = response.data['token'];
      if (resultToken != null) {
        prefs.setString('token', resultToken);
        Logger().d(resultToken);
      }
    } catch (e) {
      // this is not a token response
    }
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
    } else if (e.response?.statusCode == 403) {
      noti('Error'.tr, 'Forbidden'.tr);
    } else if (e.response?.statusCode == 500) {
      noti('Error'.tr, 'Server Error'.tr);
    } else {
      try {
        noti('Error'.tr,
            e.response?.data['message'] ?? e.response?.data['error']);
      } catch (s) {
        noti('Error'.tr, s.toString());
      }

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
      final errorMessage = e.response!.data['message'];
      noti('Error'.tr, errorMessage);
    } catch (s) {
      noti('Error'.tr, e.response!.data.toString());
    }
    Logger().e(e.response?.data);
  }
}
