import 'package:Trip/client/base_client.dart';
import 'package:Trip/model/country_model.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  Rx<CountryModel> countryModel = CountryModel().obs;
  Future get({
    String path = '',
    Map<String, dynamic> queryParameters = const {},
  }) async {
    var response = await BaseClient.get(
      api: path,
      queryParameters: queryParameters,
    );
    countryModel.value = CountryModel.fromJson(response);
    return response;
  }
}
