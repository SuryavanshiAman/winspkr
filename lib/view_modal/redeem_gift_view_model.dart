import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:wins_pkr/repo/redeem_gift_repo.dart';
import 'package:wins_pkr/utils/utils.dart';
import 'package:wins_pkr/view_modal/profile_view_model.dart';
import 'package:wins_pkr/view_modal/redeem_gift_his_view_model.dart';
import 'package:wins_pkr/view_modal/user_view_modal.dart';

class RedeemGiftViewModel with ChangeNotifier {
  final _redeemGiftRepo = RedeemGiftRepository();

  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> redeemGiftApi(dynamic giftCode, context) async {
    setLoading(true);
    final reGiftHisViewModel = Provider.of<RedeemGiftHisViewModel>(context, listen: false);
    final profileViewModel = Provider.of<ProfileViewModel>(context, listen: false);
    UserViewModel userViewModal = UserViewModel();
    String? userId = await userViewModal.getUser();
    Map data = {"userid": userId, "code": giftCode};
    _redeemGiftRepo.redeemGiftApi(data).then((value) {
      if (value['status'] == 200) {
        setLoading(false);
        Utils.flushBarSuccessMessage(
          value['message'].toString(),
          context,
        );
        reGiftHisViewModel.redeemGiftHisApi(context);
        profileViewModel.userProfileApi(context);
      } else {
        setLoading(false);
        Utils.flushBarErrorMessage(
          value['message'].toString(),
          context,
        );
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }
}
