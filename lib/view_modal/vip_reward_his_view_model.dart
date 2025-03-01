import 'package:flutter/foundation.dart';
import 'package:wins_pkr/model/vip_reward_his_model.dart';
import 'package:wins_pkr/repo/vip_reward_his_repo.dart';
import 'package:wins_pkr/utils/utils.dart';
import 'package:wins_pkr/view_modal/user_view_modal.dart';

class VipRewardHisViewModel with ChangeNotifier {
  final _vipRewardHisRepo = VipRewardHisRepository();

  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  VipRewardHisModel? _vipRewardHisModel;
  VipRewardHisModel? get vipRewardHisModel => _vipRewardHisModel;
  setListData(VipRewardHisModel value) {
    _vipRewardHisModel = value;
    notifyListeners();
  }


  Future<void> vipRewardHisApi(context) async {
    setLoading(true);
    UserViewModel userViewModel = UserViewModel();
    String? token = await userViewModel.getUser();
    _vipRewardHisRepo.vipRewardHisApi(token).then((value) {
      if (value.status== 200) {
        setLoading(false);
        setListData(value);
      } else {
        setLoading(false);
        Utils.flushBarErrorMessage(
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