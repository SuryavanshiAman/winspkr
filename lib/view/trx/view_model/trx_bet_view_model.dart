import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wins_pkr/view_modal/profile_view_model.dart';
import 'package:provider/provider.dart';
import 'package:wins_pkr/utils/utils.dart';
import 'package:wins_pkr/view/trx/controller/trx_controller.dart';
import 'package:wins_pkr/view/trx/repo/trx_bet_repo.dart';
import 'package:wins_pkr/view_modal/user_view_modal.dart';

class TrxBetViewModel with ChangeNotifier {
  final _trxBetRepo = TrxBetRepository();

  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> trxAddBet(
      dynamic number, dynamic amount, int gameId, context) async {
    final trc = Provider.of<TrxController>(context, listen: false);
    if (gameId == 6) {
      if (!trc.isPlayAllowed(trc.oneMinuteTime, trc.oneMinuteStatus, context)) return;
    } else if (gameId == 7) {
      if (!trc.isPlayAllowed(
          trc.threeMinuteTime, trc.threeMinuteStatus, context)) return;
    } else if (gameId == 8) {
      if (!trc.isPlayAllowed(trc.fiveMinuteTime, trc.fiveMinuteStatus, context)) return;
    } else {
      if (!trc.isPlayAllowed(trc.tenMinuteTime, trc.tenMinuteStatus, context)) return;
    }
    setLoading(true);
    UserViewModel userViewModal = UserViewModel();
    String? userId = await userViewModal.getUser();
    Map data = {
      "userid": userId,
      "game_id": gameId.toString(),
      "number": number,
      "amount": amount,
    };
    _trxBetRepo.trxAddBet(data).then((value) {
      if (value['status'] == 200) {
        setLoading(false);
        Navigator.pop(context);
        Provider.of<ProfileViewModel>(context, listen: false).userProfileApi(context);
        Utils.flushBarSuccessMessage(
          value['message'].toString(), context);
      } else {
        setLoading(false);
        Utils.flushBarErrorMessage(
          value['message'].toString(), context);
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }
}