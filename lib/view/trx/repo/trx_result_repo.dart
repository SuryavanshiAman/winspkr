import 'package:flutter/foundation.dart';
import 'package:wins_pkr/helper/network/base_api_services.dart';
import 'package:wins_pkr/helper/network/network_api_services.dart';
import 'package:wins_pkr/view/trx/model/trx_result_model.dart';
import 'package:wins_pkr/view/trx/res/trx_api_url.dart';

class TrxResultRepository {
  final BaseApiServices _apiServices = NetworkApiServices();
  Future<TrxResultModel> trxResultApi(context, dynamic data) async {
    try {
      dynamic response = await _apiServices
          .getGetApiResponse(TrxApiUrl.trxResult + data);
      return TrxResultModel.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during trxResultApi: $e');
      }
      rethrow;
    }
  }
}
