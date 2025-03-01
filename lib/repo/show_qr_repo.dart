import 'package:flutter/foundation.dart';
import 'package:wins_pkr/helper/network/base_api_services.dart';
import 'package:wins_pkr/helper/network/network_api_services.dart';
import 'package:wins_pkr/model/show_qr_model.dart';
import 'package:wins_pkr/res/api_urls.dart';

class ShowQrRepository {
  final BaseApiServices _apiServices = NetworkApiServices();
  Future<ShowQrModel> showQrApi(dynamic data) async {
    try {
      dynamic response = await _apiServices
          .getGetApiResponse('${ApiUrl.showQrUrl}$data');
      return ShowQrModel.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during showQrApi: $e');
      }
      rethrow;
    }
  }

  ///Submit ScreenShot

  Future<dynamic> usdtAccountViewApi(dynamic data) async {
    try {
      dynamic response = await _apiServices
          .getPostApiResponse(ApiUrl.usdtPayIn, data);
      return response;
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during usdtAccountViewApi: $e');
      }
      rethrow;
    }
  }
}