import 'package:valorant_game_guide/api/api_routes.dart';
import 'package:valorant_game_guide/api/api_service.dart';
import 'package:valorant_game_guide/model/weapon_model.dart';

class WeaponService {
  static Future weaponService() async {
    var response = await ApiService().getResponse(
      apiType: APIType.aGet,
      url: ApiRoutes.weapon,
    );

    WeaponResponseModel weaponResponseModel =
        WeaponResponseModel.fromJson(response);
    return weaponResponseModel;
  }
}
