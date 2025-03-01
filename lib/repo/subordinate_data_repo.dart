import 'package:flutter/foundation.dart';
import 'package:wins_pkr/helper/network/base_api_services.dart';
import 'package:wins_pkr/helper/network/network_api_services.dart';
import 'package:wins_pkr/model/subordinate_data_model.dart';
import 'package:wins_pkr/res/api_urls.dart';

class SubordinateDataRepository{
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<SubordinateDataModel> subordinateDataApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(ApiUrl.getSubData,data);
      return SubordinateDataModel.fromJson(response);
    } catch (e) {
      if (kDebugMode){
        print('Error occurred during subordinateDataApi: $e');
      }
      rethrow;
    }
  }

}