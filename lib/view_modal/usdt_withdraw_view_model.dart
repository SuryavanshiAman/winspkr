import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wins_pkr/repo/auth_repo.dart';
import 'package:wins_pkr/repo/usdt_withdraw_repo.dart';
import 'package:wins_pkr/utils/routes/routers_name.dart';
import 'package:wins_pkr/utils/utils.dart';
import 'package:wins_pkr/view_modal/user_view_modal.dart';
import 'package:provider/provider.dart';

class UsdtWithdrawViewModel with ChangeNotifier {
  final _usdtWithdrawRepository = UsdtWithdrawApiRepository();

  bool _loadingOne = false;
  bool get loadingOne => _loadingOne;
  setLoadingOne(bool value) {
    _loadingOne = value;
    notifyListeners();
  }

  Future<void> usdtWithdrawApi(dynamic usdtWalletAddress, dynamic amountInr, dynamic usdtAmount, context) async {
    UserViewModel userViewModal = UserViewModel();
    String? userId = await userViewModal.getUser();
    setLoadingOne(true);
    Map data = {
      "user_id":userId,
      "usdt_wallet_address":usdtWalletAddress,
      "amount_inr":amountInr,
      "usdt_amount":usdtAmount,
      "type":"3"
    };
    _usdtWithdrawRepository.usdtWithdrawApi(data).then((value) async {
      if (value['status'] == 200) {
        setLoadingOne(false);
        Utils.flushBarSuccessMessage(
          value['message'].toString(),
          context,
        );
      } else {
        setLoadingOne(false);
        Utils.flushBarErrorMessage(
          value['message'].toString(),
          context,
        );
      }
    }).onError((error, stackTrace) {
      setLoadingOne(false);
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }

}
