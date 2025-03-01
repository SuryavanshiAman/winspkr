import 'package:flutter/foundation.dart';
import 'package:wins_pkr/helper/network/base_api_services.dart';
import 'package:wins_pkr/helper/network/network_api_services.dart';
import 'package:wins_pkr/model/deposit_history_model.dart';
import 'package:wins_pkr/res/api_urls.dart';

class DepositRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> depositApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(ApiUrl.payIn , data);
      return response;
    } catch (e) {
      if (kDebugMode){
        print('Error occurred during depositApi: $e');
      }
      rethrow;
    }
  }

  Future<dynamic> usdtPayIn(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(ApiUrl.usdtPayIn , data);
      return response;
    } catch (e) {
      if (kDebugMode){
        print('Error occurred during usdtPayIn: $e');
      }
      rethrow;
    }
  }


  Future<DepositHistoryModel> depositHistoryApi(dynamic userId , dynamic type) async {
    try {
      dynamic response = await _apiServices.getGetApiResponse("${ApiUrl.depositHistory}$userId&type=$type");
      return DepositHistoryModel.fromJson(response);
    } catch (e) {
      if (kDebugMode){
        print('Error occurred during depositViewApi: $e');
      }
      rethrow;
    }
  }

}