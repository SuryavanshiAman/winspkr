import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:wins_pkr/utils/utils.dart';
import 'package:wins_pkr/view/trx/controller/trx_controller.dart';
import 'package:wins_pkr/view/trx/model/trx_game_his_model.dart';
import 'package:wins_pkr/view/trx/repo/trx_game_his_repo.dart';

class TrxGameHisViewModel with ChangeNotifier {
  final _trxGameHisRepo = TrxGameHisRepository();

  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  TrxGameHisModel? _trxGameHisModelData;
  TrxGameHisModel? get trxGameHisModelData => _trxGameHisModelData;
  setWinGoGameHis(TrxGameHisModel value) {
    _trxGameHisModelData = value;
    notifyListeners();
  }

  Future<void> trxGameHisApi(context, dynamic offset) async {
    setLoading(true);
    final trc = Provider.of<TrxController>(context, listen: false);
    _trxGameHisRepo
        .trxGameHisApi(
            context, trc.trxTimerList[trc.gameIndex].gameId.toString(), offset)
        .then((value) {
      if (value.status == 200) {
        setLoading(false);
        setWinGoGameHis(value);
      } else {
        setLoading(false);
        Utils.flushBarSuccessMessage(value.message.toString(), context);
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }
}
