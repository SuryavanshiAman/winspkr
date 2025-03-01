import 'package:flutter/foundation.dart';
import 'package:wins_pkr/helper/network/base_api_services.dart';
import 'package:wins_pkr/helper/network/network_api_services.dart';
import 'package:wins_pkr/view/wingo/res/win_go_api_url.dart';
import 'package:wins_pkr/view/wingo/model/win_go_my_his_model.dart';

class WinGoMyHisRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<WinGoMyHisModel> myBetHisApi(dynamic data) async {
    try {
      dynamic response = await _apiServices
          .getPostApiResponse(WinGoApiUrl.winGoMyBetHis,data);
      return WinGoMyHisModel.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during myBetHisApi: $e');
      }
      rethrow;
    }
  }
}
