import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:wins_pkr/utils/utils.dart';
import 'package:wins_pkr/view/wingo/controller/win_go_controller.dart';
import 'package:wins_pkr/view/wingo/model/win_go_game_his_model.dart';
import 'package:wins_pkr/view/wingo/repo/win_go_game_his_repo.dart';


class WinGoGameHisViewModel with ChangeNotifier {
  final _winGoGameHisRepo = WinGoGameHisRepository();

  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  WinGoGameHisModel? _winGoGameHisModelData;
  WinGoGameHisModel? get winGoGameHisModelData => _winGoGameHisModelData;
  setWinGoGameHis(WinGoGameHisModel value) {
    _winGoGameHisModelData = value;
    notifyListeners();
  }

  Future<void> gameHisApi(context, dynamic offset) async {
    setLoading(true);
    final wgc = Provider.of<WinGoController>(context, listen: false);
    _winGoGameHisRepo.gameHisApi(context, (wgc.gameIndex + 1).toString(),offset).then((value) {
      if (value.status == 200) {
        setLoading(false);
        setWinGoGameHis(value);
      } else {
        setLoading(false);
        Utils.flushBarSuccessMessage(
            value.message.toString(), context, );
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }
}
