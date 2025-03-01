import 'package:flutter/foundation.dart';
import 'package:wins_pkr/model/redeem_gift_his_model.dart';
import 'package:wins_pkr/repo/redeem_gift_his_repo.dart';
import 'package:wins_pkr/view_modal/user_view_modal.dart';

class RedeemGiftHisViewModel with ChangeNotifier {
  final _redeemGiftHisRepo = RedeemGiftHisRepository();

  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  RedeemGiftHisModel? _redeemGiftHisModel;

  RedeemGiftHisModel? get redeemGiftHisModel => _redeemGiftHisModel;

  setListData(RedeemGiftHisModel value) {
    _redeemGiftHisModel = value;
    notifyListeners();
  }

  Future<void> redeemGiftHisApi(context) async {
    setLoading(true);
    UserViewModel userViewModal = UserViewModel();
    String? userId = await userViewModal.getUser();
    _redeemGiftHisRepo.redeemGiftHisApi(userId).then((value) {
      if (value.status == 200) {
        setLoading(false);
        setListData(value);
      } else {
        setLoading(false);
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }
}