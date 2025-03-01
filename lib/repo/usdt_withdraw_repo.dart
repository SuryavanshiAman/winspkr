import 'package:flutter/foundation.dart';
import 'package:wins_pkr/helper/network/base_api_services.dart';
import 'package:wins_pkr/res/api_urls.dart';
import '../helper/network/network_api_services.dart';

class UsdtWithdrawApiRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> usdtWithdrawApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(ApiUrl.usdtWithdrawUrl, data);
      return response;
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during usdtWithdrawApi: $e');
      }
      rethrow;
    }
  }
}
