import 'package:Trip/config/const_wodget/PaginatedList.dart';
import 'package:Trip/config/const_wodget/dropdown.dart';
import 'package:Trip/config/constant.dart';
import 'package:Trip/controller/data_controller.dart';
import 'package:Trip/model/country_model.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SplashPage'),
        centerTitle: true,
      ),
      body: PaginatedList(
        changeState: (p0) {
          return true;
        },
        height: 500,
        totalPage: 4,
        model: CountryModel,
        data: controller.countryModel.value.result?.data ?? [],
        refreshController: refreshController,
        controller: controller,
        child: Text('data'),
      ),
    );
  }

  DataController controller = Get.find();
  RefreshController refreshController = RefreshController();
  @override
  void initState() {
    controller.get(
      path: '/Country',
      queryParameters: {},
    );
    super.initState();
  }
}
