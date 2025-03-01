import 'package:flutter/foundation.dart';
import 'package:wins_pkr/helper/network/base_api_services.dart';
import 'package:wins_pkr/helper/network/network_api_services.dart';
import 'package:wins_pkr/model/profile_model.dart';
import 'package:wins_pkr/res/api_urls.dart';

class UserProfileRepository {
  final BaseApiServices _apiServices = NetworkApiServices();
  
  Future<ProfileModel> userProfileApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(ApiUrl.profile + data);
      return ProfileModel.fromJson(response);
    } catch (e) {
      if (kDebugMode){
        print('Error occurred during userProfileApi: $e');
      }
      rethrow;
    }
  }
  
}