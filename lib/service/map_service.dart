import 'package:http/http.dart' as http;
import 'package:valorant_game_guide/api/api_routes.dart';
import 'package:valorant_game_guide/api/api_service.dart';
import 'package:valorant_game_guide/model/map_model.dart';
import 'package:valorant_game_guide/model/school_model.dart';

class MapService {
  static Future mapService() async {
    var response = await ApiService().getResponse(
      apiType: APIType.aGet,
      url: ApiRoutes.map,
    );

    MapResponseModel mapResponseModel = MapResponseModel.fromJson(response);
    return mapResponseModel;
  }
}

class MapService1 {
  static Future<MapResponseModel?> mapService1() async {
    var response = await http.get(Uri.parse(ApiRoutes.map));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      print('====>>> ${response.body}');
      return mapResponseModelFromJson(jsonString);
    }
  }
}

class SchoolService {
  static Future<SchoolModel?> schoolService() async {
    var response = await http.get(Uri.parse(ApiRoutes.school));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      print('====>>> ${response.body}');
      return schoolModelFromJson(jsonString);
    }
  }
}
