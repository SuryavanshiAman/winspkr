import 'package:flutter/foundation.dart';
import 'package:wins_pkr/model/vip_show_list_model.dart';
import 'package:wins_pkr/repo/vip_show_list_repo.dart';
import 'package:wins_pkr/utils/utils.dart';
import 'package:wins_pkr/view_modal/user_view_modal.dart';

class VipShowListViewModel with ChangeNotifier {
  final _vipShowListRepo = VipShowListRepository();

  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  VipShowListModel? _vipShowListModel;
  VipShowListModel? get vipShowListModel => _vipShowListModel;
  setListData(VipShowListModel value) {
    _vipShowListModel = value;
    notifyListeners();
  }

  int _vipIndexData = 0;
  int get vipIndexData => _vipIndexData;
  setIndexData(int value) {
    _vipIndexData = value;
    notifyListeners();
  }

  Future<void> vipShowListApi(context) async {
    setLoading(true);
    setIndexData(0);
    UserViewModel userViewModel = UserViewModel();
    String? token = await userViewModel.getUser();
    _vipShowListRepo.vipShowListApi(token).then((value) {
      if (value.status == 200) {
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
