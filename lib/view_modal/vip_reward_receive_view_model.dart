import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:wins_pkr/repo/vip_reward_receive_repo.dart';
import 'package:wins_pkr/utils/utils.dart';
import 'package:wins_pkr/view_modal/vip_reward_his_view_model.dart';

class VipRewardReceiveViewModel with ChangeNotifier {
  final _vipRewardReceiveRepo = VipRewardReceiveRepository();

  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> vipRewardReceiveApi(dynamic data, context) async {
    setLoading(true);
    final vrh=Provider.of<VipRewardHisViewModel>(context,listen: false);
    _vipRewardReceiveRepo.vipRewardReceiveApi(data).then((value) {
      if (value['status'] == 200) {
        setLoading(false);
        vrh.vipRewardHisApi(context);
        Utils.flushBarErrorMessage(value['message'], context);
      } else {
        setLoading(false);
        Utils.flushBarErrorMessage(value['message'], context);
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }
}
