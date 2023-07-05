import '../models/agents_response_model.dart';
import '../utils/dio_client.dart';

class AgentsApi {
  Future<AgentsResponseModel> getAgents() async {
    try {
      final response = await DioClient.getDioInstance()
          .get("v1/agents", queryParameters: {"isPlayableCharacter": true});
      return AgentsResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
