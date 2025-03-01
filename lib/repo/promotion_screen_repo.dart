import 'package:flutter/foundation.dart';
import 'package:wins_pkr/helper/network/base_api_services.dart';
import 'package:wins_pkr/helper/network/network_api_services.dart';
import 'package:wins_pkr/model/promotion_model.dart';
import 'package:wins_pkr/res/api_urls.dart';

class PromotionRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<PromotionDataModel> promotionApi(dynamic userId) async {
    try {
      dynamic response = await _apiServices.getGetApiResponse("${ApiUrl.promotionScreen}$userId");
      return PromotionDataModel.fromJson(response);
    } catch (e) {
      if (kDebugMode){
        print('Error occurred during promotionApi: $e');
      }
      rethrow;
    }
  }

}