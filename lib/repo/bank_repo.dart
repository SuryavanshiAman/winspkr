import 'package:flutter/foundation.dart';
import 'package:wins_pkr/helper/network/base_api_services.dart';
import 'package:wins_pkr/helper/network/network_api_services.dart';
import 'package:wins_pkr/model/add_account_model.dart';
import 'package:wins_pkr/res/api_urls.dart';


class BankRepository{
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<AddAccountModel> accountViewApi(dynamic userId) async {
    try {
      dynamic response = await _apiServices.getGetApiResponse("${ApiUrl.accountView}$userId");
      return AddAccountModel.fromJson(response);
    } catch (e) {
      if (kDebugMode){
        print('Error occurred during accountViewApi: $e');
      }
      rethrow;
    }
  }

  Future<dynamic> addBankApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(ApiUrl.addBank , data);
      return response;
    } catch (e) {
      if (kDebugMode){
        print('Error occurred during addBankApi: $e');
      }
      rethrow;
    }
  }

  Future<dynamic> deleteAccountApi(String id) async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(ApiUrl.accountDelete+id);
      return response;
    } catch (e) {
      if (kDebugMode){
        print('Error occurred during deleteAccountApi: $e');
      }
      rethrow;
    }
  }
}