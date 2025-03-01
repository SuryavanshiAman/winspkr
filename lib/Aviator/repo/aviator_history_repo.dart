
import 'package:flutter/foundation.dart';
import 'package:wins_pkr/Aviator/model/aviator_history_model.dart';
import 'package:wins_pkr/Aviator/res/api_url.dart';
import 'package:wins_pkr/helper/network/base_api_services.dart';
import 'package:wins_pkr/helper/network/network_api_services.dart';


class AviatorHistoryRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<AviatorHistoryModel> aviatorHistoryApi(dynamic data) async {
    try {
      dynamic response =
      await _apiServices.getPostApiResponse(AviatorApiUrl.aviatorHistory,data);
      return AviatorHistoryModel.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during aviatorHistoryApi: $e');
      }
      rethrow;
    }
  }
}