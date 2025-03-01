import 'package:flutter/foundation.dart';
import 'package:wins_pkr/helper/network/base_api_services.dart';
import 'package:wins_pkr/helper/network/network_api_services.dart';
import 'package:wins_pkr/res/api_urls.dart';

class RedeemGiftRepository {
  final BaseApiServices _apiServices = NetworkApiServices();
  Future<dynamic> redeemGiftApi(dynamic data) async {
    try {
      dynamic response = await _apiServices
          .getPostApiResponse(ApiUrl.redeemGift,data);
      return response;
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during redeemGiftApi: $e');
      }
      rethrow;
    }
  }
}