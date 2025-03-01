import 'package:flutter/foundation.dart';
import 'package:wins_pkr/view/mines/model/mine_drop_down_model.dart';
import 'package:wins_pkr/view/mines/repo/mine_drop_down_repo.dart';

class MineDropDownViewModel with ChangeNotifier {
  final _mineDropDownRepo = MineDropDownRepository();

  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  MineDropDownModel? _mineDropDownModel;
  MineDropDownModel? get mineDropDownModel => _mineDropDownModel;

  void setMineDropDownData(MineDropDownModel value) {
    _mineDropDownModel = value;
    notifyListeners();
  }

  Future<void> mineMultiplierApi(context) async {
    _mineDropDownRepo.mineMultiplierApi().then((value) {
      if (value.status == 200) {
        setMineDropDownData(value);
      } else {
        if (kDebugMode) {}
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }


}
