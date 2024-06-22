import 'package:Trip/config/interceptor/dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:logger/logger.dart';
import 'package:tuple/tuple.dart';

class BaseClient {
  static DioHttp get dioHttp => Get.find<DioHttp>();

  static Future<dynamic> get({
    required String api,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      Response<dynamic> response =
          await dioHttp.dio.get(api, queryParameters: queryParameters);
      return response.data;
    } catch (e) {
      Logger().e("Error in GET request: $e");
      return false;
    }
  }

  static Future<Tuple2<bool, dynamic>> post({
    required String api,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
  }) async {
    try {
      Response<dynamic> response = await dioHttp.dio
          .post(api, queryParameters: queryParameters, data: data);
      return Tuple2(true, response.data);
    } catch (e) {
      Logger().e("Error in POST request: $e");
      return const Tuple2(false, null);
    }
  }

  static Future<Tuple2<bool, dynamic>> postFormData({
    required String api,
    Map<String, dynamic>? queryParameters,
    FormData? data,
  }) async {
    try {
      Response<dynamic> response = await dioHttp.dio.post(
        api,
        queryParameters: queryParameters,
        data: data,
        options: Options(
          // contentType: "multipart/form-data",

          receiveTimeout: const Duration(days: 21),
          sendTimeout: const Duration(days: 21),
        ),
      );
      return Tuple2(true, response.data);
    } catch (e) {
      Logger().e("Error in POST (FormData) request:");
      Logger().e(e);
      return const Tuple2(false, null);
    }
  }

  static Future<bool> put({
    required String api,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
  }) async {
    try {
      await dioHttp.dio.put(api, queryParameters: queryParameters, data: data);
      return true;
    } catch (e) {
      Logger().e("Error in PUT request: $e");
      return false;
    }
  }

  static Future<bool> delete({
    required String api,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      await dioHttp.dio.delete(api, queryParameters: queryParameters);
      return true;
    } catch (e) {
      Logger().e("Error in DELETE request: $e");
      return false;
    }
  }
}
