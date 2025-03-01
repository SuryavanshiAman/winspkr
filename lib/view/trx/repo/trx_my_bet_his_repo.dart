import 'package:flutter/foundation.dart';
import 'package:wins_pkr/helper/network/base_api_services.dart';
import 'package:wins_pkr/helper/network/network_api_services.dart';
import 'package:wins_pkr/view/trx/model/trx_my_bet_his_model.dart';
import 'package:wins_pkr/view/trx/res/trx_api_url.dart';

class TrxMyBetHisRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<TrxMyBetHisModel> trxMyBetHisApi(dynamic data) async {
    try {
      dynamic response = await _apiServices
          .getPostApiResponse(TrxApiUrl.trxMyBetHis,data);
      return TrxMyBetHisModel.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during trxMyBetHisApi: $e');
      }
      rethrow;
    }
  }
}