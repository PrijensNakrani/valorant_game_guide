import 'package:get/get.dart';

class AbilityController extends GetxController {
  var Ability = 0.obs;

  selectedAbility(value) {
    Ability.value = value;
  }

  selectedAbility1(index) {
    Ability.value = index;
  }
}
