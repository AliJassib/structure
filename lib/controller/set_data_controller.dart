import 'package:Trip/config/constant.dart';

class SetDataController extends GetxController {
  Rx<int> indexPage = 0.obs;
  Rx<int> page = 0.obs;
  RxBool isDark = false.obs;
  PageController pagesController = PageController();
  RxInt tabIndex = 0.obs;
}
