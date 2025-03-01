import 'package:flutter/foundation.dart';
import 'package:wins_pkr/helper/network/base_api_services.dart';
import 'package:wins_pkr/helper/network/network_api_services.dart';
import 'package:wins_pkr/res/api_urls.dart';

class ForgetPassRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> sendOtp(dynamic phoneNumber) async {
    try {
      dynamic response =
      await _apiServices.getGetApiResponse("${ApiUrl.sendOtp}mode=live&digit=4&mobile=$phoneNumber");
      return response;
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during sendOtp: $e');
      }
      rethrow;
    }
  }

  // Future<dynamic> verifyOtp(dynamic phone) async {
  //   try {
  //     dynamic response =
  //     await _apiServices.getGetApiResponse("${ApiUrl.verifyOtp}$phone");
  //     return response;
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print('Error occurred during verifyOtp: $e');
  //     }
  //     rethrow;
  //   }
  // }

  Future<dynamic> forgetPassApi(dynamic data) async {
    try {
      dynamic response =
      await _apiServices.getPostApiResponse(ApiUrl.forgetPassword, data);
      return response;
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during forgetPassApi: $e');
      }
      rethrow;
    }
  }
  

}