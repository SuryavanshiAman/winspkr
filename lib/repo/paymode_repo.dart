import 'package:flutter/foundation.dart';
import 'package:wins_pkr/helper/network/base_api_services.dart';
import 'package:wins_pkr/helper/network/network_api_services.dart';
import 'package:wins_pkr/model/payment_mode_model.dart';
import 'package:wins_pkr/res/api_urls.dart';

class PaymodeRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<PaymentModeModel> payModeApi() async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(ApiUrl.payModesUrl);
      return PaymentModeModel.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during payModeApi: $e');
      }
      rethrow;
    }
  }
}
