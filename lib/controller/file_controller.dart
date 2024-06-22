import 'dart:io';

import 'package:Trip/client/base_client.dart';
import 'package:Trip/config/constant.dart';
import 'package:dio/dio.dart' as dio;

import 'package:tuple/tuple.dart';

class FileController extends GetxController {
  RxBool loading = false.obs;

  Future<Tuple2<bool, dynamic>> upload(
      {File? path, bool multiFile = false, List<File>? files}) async {
    loading.value = true;
    List<dio.MultipartFile> list = [];

    if (multiFile) {
      for (var file in files!) {
        list.add(await dio.MultipartFile.fromFile(file.path));
      }
    }
    var response = await BaseClient.postFormData(
        api: multiFile ? '/file/multi' : '/file',
        data: multiFile
            ? dio.FormData.fromMap({'files': list})
            : dio.FormData.fromMap({
                "file": await dio.MultipartFile.fromFile(path!.path),
              }));

    loading.value = false;
    return response;
  }
}
