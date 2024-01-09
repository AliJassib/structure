// ignore_for_file: unused_local_variable


import 'package:Trip/config/interceptor/dio_interceptor.dart';
import 'package:get/get.dart';

class BindingsController extends Bindings {
  @override
  void dependencies() {
    DioHttp dioHttp = Get.put(DioHttp());

  }
}
