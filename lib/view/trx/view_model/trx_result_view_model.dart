import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:wins_pkr/utils/utils.dart';
import 'package:wins_pkr/view/trx/controller/trx_controller.dart';
import 'package:wins_pkr/view/trx/model/trx_result_model.dart';
import 'package:wins_pkr/view/trx/repo/trx_result_repo.dart';
import 'package:wins_pkr/view/trx/view_model/trx_win_amount_view_model.dart';

class TrxResultViewModel with ChangeNotifier {
  final _trxResultRepo = TrxResultRepository();

  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  TrxResultModel? _trxResultModelData;
  TrxResultModel? get trxResultModelData => _trxResultModelData;
  setTrxResultData(TrxResultModel value) {
    _trxResultModelData = value;
    notifyListeners();
  }

  int? _gameSrNo;
  int? get gameSrNo => _gameSrNo;
  void setPeriodNo(int gameSrNo) {
    _gameSrNo = gameSrNo;
    notifyListeners();
  }

  Future<void> trxResultApi(context, int status) async {
    setLoading(true);
    final wam = Provider.of<TrxWinAmountViewModel>(context, listen: false);
    final trc = Provider.of<TrxController>(context, listen: false);
    _trxResultRepo
        .trxResultApi(context, trc.trxTimerList[trc.gameIndex].gameId.toString())
        .then((value) {
      if (value.status == 200) {
        setPeriodNo(value.data!.gamesNo! + 1);
        setLoading(false);
        setTrxResultData(value);
        if (status == 1) {
          wam.trxWinAmountApi(
              context, trc.trxTimerList[trc.gameIndex].gameId.toString(), value.data!.gamesNo);
        }
      } else {
        setLoading(false);
        Utils.flushBarSuccessMessage(
            value.message.toString(), context);
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }
}