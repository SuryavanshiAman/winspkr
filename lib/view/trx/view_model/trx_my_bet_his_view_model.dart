import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:wins_pkr/utils/utils.dart';
import 'package:wins_pkr/view/trx/controller/trx_controller.dart';
import 'package:wins_pkr/view/trx/model/trx_my_bet_his_model.dart';
import 'package:wins_pkr/view/trx/repo/trx_my_bet_his_repo.dart';
import 'package:wins_pkr/view_modal/user_view_modal.dart';

class TrxMyBetHisViewModel with ChangeNotifier {
  final _trxMyBetHisRepo = TrxMyBetHisRepository();

  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  TrxMyBetHisModel? _trxMyBetHisModelData;
  TrxMyBetHisModel? get trxMyBetHisModelData => _trxMyBetHisModelData;
  setMyBetHisData(TrxMyBetHisModel value) {
    _trxMyBetHisModelData = value;
    notifyListeners();
  }

  Future<void> trxMyBetHisApi(context, int offset) async {
    setLoading(true);
    final trc = Provider.of<TrxController>(context, listen: false);
    UserViewModel userViewModal = UserViewModel();
    String? userId = await userViewModal.getUser();
    Map data = {
      "game_id": trc.trxTimerList[trc.gameIndex].gameId.toString(),
      "userid": userId,
      "limit": "10",
      "offset": offset
    };
    _trxMyBetHisRepo.trxMyBetHisApi(data).then((value) {
      if (value.status == 200) {
        setLoading(false);
        setMyBetHisData(value);
      } else {
        setLoading(false);
        Utils.flushBarSuccessMessage(
          value.message.toString(),
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
