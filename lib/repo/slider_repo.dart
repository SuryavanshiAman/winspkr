import 'package:flutter/foundation.dart';
import 'package:wins_pkr/helper/network/base_api_services.dart';
import 'package:wins_pkr/helper/network/network_api_services.dart';
import 'package:wins_pkr/model/slider_modal.dart';
import 'package:wins_pkr/res/api_urls.dart';


class SliderRepository{
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<SliderModel> sliderApi() async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(ApiUrl.slider);
      return SliderModel.fromJson(response);
    } catch (e) {
      if (kDebugMode){
        print('Error occurred during sliderApi: $e');
      }
      rethrow;
    }
  }

}