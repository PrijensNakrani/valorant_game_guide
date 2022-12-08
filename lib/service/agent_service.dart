import 'package:valorant_game_guide/api/api_routes.dart';
import 'package:valorant_game_guide/api/api_service.dart';
import 'package:valorant_game_guide/model/agent_model.dart';

class AgentService {
  static Future agentService() async {
    var response = await ApiService().getResponse(
      apiType: APIType.aGet,
      url: ApiRoutes.agent,
    );

    AgentResponseModel agentResponseModel =
        AgentResponseModel.fromJson(response);
    return agentResponseModel;
  }
}
