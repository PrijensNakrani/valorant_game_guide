import 'package:valorant_game_guide/api/api_routes.dart';
import 'package:valorant_game_guide/api/api_service.dart';
import 'package:valorant_game_guide/model/rank_model.dart';

class RankService {
  static Future rankService() async {
    var response = await ApiService().getResponse(
      apiType: APIType.aGet,
      url: ApiRoutes.rank,
    );

    RankResponseModel rankResponseModel = RankResponseModel.fromJson(response);
    return rankResponseModel;
  }
}
