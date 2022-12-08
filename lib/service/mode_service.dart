import 'package:valorant_game_guide/api/api_routes.dart';
import 'package:valorant_game_guide/api/api_service.dart';
import 'package:valorant_game_guide/model/mode_model.dart';

class ModeService {
  static Future modeService() async {
    var response = await ApiService().getResponse(
      apiType: APIType.aGet,
      url: ApiRoutes.mode,
    );

    ModeResponseModel modeResponseModel = ModeResponseModel.fromJson(response);
    return modeResponseModel;
  }
}
