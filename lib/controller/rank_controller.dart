import 'package:get/get.dart';
import 'package:valorant_game_guide/api/api_response.dart';
import 'package:valorant_game_guide/model/rank_model.dart';
import 'package:valorant_game_guide/service/rank_service.dart';

class RankController extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');
  ApiResponse get apiResponse => _apiResponse;
  onInit() {
    getRankData();
  }

  Future getRankData() async {
    _apiResponse = ApiResponse.loading(message: 'Loading...');
    try {
      RankResponseModel? rankResponseModel = await RankService.rankService();
      _apiResponse = ApiResponse.complete(rankResponseModel);
    } catch (e) {
      print('ERROR : $e');
      _apiResponse = ApiResponse.error(message: 'Error');
    }
    update();
  }
}
