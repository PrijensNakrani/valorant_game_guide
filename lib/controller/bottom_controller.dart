import 'package:get/get.dart';

class BottomController extends GetxController {
  var selectMenu = 0.obs;

  selectedMenu(index) {
    selectMenu.value = index;
  }
}
