import 'package:flutter/foundation.dart';
import 'package:wins_pkr/utils/utils.dart';
import 'package:wins_pkr/view/mines/model/mine_bet_his_model.dart';
import 'package:wins_pkr/view/mines/repo/mine_bet_his_repo.dart';
import 'package:wins_pkr/view_modal/user_view_modal.dart';

class MineBetHisViewModel with ChangeNotifier {
  final _mineBetHisRepo = MineBetHisRepository();

  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  MineBetHisModel? _mineBetHisModelData;
  MineBetHisModel? get mineBetHisModelData => _mineBetHisModelData;
  setBetHistoryData(MineBetHisModel value) {
    _mineBetHisModelData = value;
    notifyListeners();
  }

  Future<void> mineBetHisApi(context, int offset) async {
    setLoading(true);
    UserViewModel userViewModal = UserViewModel();
    String? userId = await userViewModal.getUser();

    _mineBetHisRepo.mineBetHisApi(userId).then((value) {
      if (value.status == 200) {
        setLoading(false);
        setBetHistoryData(value);
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
