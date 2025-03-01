import 'package:flutter/foundation.dart';
import 'package:wins_pkr/helper/network/base_api_services.dart';
import 'package:wins_pkr/helper/network/network_api_services.dart';
import 'package:wins_pkr/view/mines/res/mine_api_url.dart';

class MineCashOutRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> mineCashOutApi(dynamic data) async {
    try {
      dynamic response =
      await _apiServices.getPostApiResponse(MineApiUrl.mineCashOut, data);
      return response;
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during mineCashOutApi: $e');
      }
      rethrow;
    }
  }
}