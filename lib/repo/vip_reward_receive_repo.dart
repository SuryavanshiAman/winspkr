import 'package:flutter/foundation.dart';
import 'package:wins_pkr/helper/network/base_api_services.dart';
import 'package:wins_pkr/res/api_urls.dart';
import 'package:wins_pkr/helper/network/network_api_services.dart';

class VipRewardReceiveRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> vipRewardReceiveApi(dynamic data) async {
    try {
      dynamic response =
      await _apiServices.getPostApiResponse(ApiUrl.vipRewardReceive,data);
      return response;
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during vipRewardReceiveApi: $e');
      }
      rethrow;
    }
  }
}