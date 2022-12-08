import 'package:get/get.dart';

class PagesController extends GetxController {
  var selectPages = 0.obs;

  selectedPages(index) {
    selectPages.value = index;
  }
}
