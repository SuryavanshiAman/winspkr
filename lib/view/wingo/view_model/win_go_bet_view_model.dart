import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wins_pkr/view_modal/profile_view_model.dart';
import 'package:provider/provider.dart';
import 'package:wins_pkr/utils/utils.dart';
import 'package:wins_pkr/view/wingo/controller/win_go_controller.dart';
import 'package:wins_pkr/view/wingo/repo/win_go_bet_repo.dart';
import 'package:wins_pkr/view_modal/user_view_modal.dart';

class WinGoBetViewModel with ChangeNotifier {
  final _winGoBetRepo = WinGoBetRepository();

  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> wingoBet(
      dynamic number, dynamic amount, int gameId, context) async {
    final wgc = Provider.of<WinGoController>(context, listen: false);
    if (gameId == 1) {
      if (!wgc.isPlayAllowed(wgc.oneMinuteTime, wgc.oneMinuteStatus, context)) return;
    } else if (gameId == 2) {
      if (!wgc.isPlayAllowed(
          wgc.threeMinuteTime, wgc.threeMinuteStatus, context)) return;
    } else if (gameId == 3) {
      if (!wgc.isPlayAllowed(wgc.fiveMinuteTime, wgc.fiveMinuteStatus, context)) return;
    } else {
      if (!wgc.isPlayAllowed(wgc.tenMinuteTime, wgc.tenMinuteStatus, context)) return;
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
    _winGoBetRepo.wingoBet(data).then((value) {
      if (value['status'] == 200) {
        setLoading(false);
        Navigator.pop(context);
        Provider.of<ProfileViewModel>(context, listen: false).userProfileApi(context);
        Utils.flushBarSuccessMessage(
            value['message'].toString(), context, );
      } else {
        setLoading(false);
        Utils.flushBarErrorMessage(
            value['message'].toString(), context, );
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }
}
