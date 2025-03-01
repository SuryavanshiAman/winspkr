import 'package:flutter/foundation.dart';
import 'package:wins_pkr/helper/network/base_api_services.dart';
import 'package:wins_pkr/model/vip_show_list_model.dart';
import 'package:wins_pkr/res/api_urls.dart';
import 'package:wins_pkr/helper/network/network_api_services.dart';

class VipShowListRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<VipShowListModel> vipShowListApi(dynamic data) async {
    try {
      dynamic response =
      await _apiServices.getGetApiResponse(ApiUrl.showVipList+data);
      return VipShowListModel.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during vipShowListApi: $e');
      }
      rethrow;
    }
  }
}