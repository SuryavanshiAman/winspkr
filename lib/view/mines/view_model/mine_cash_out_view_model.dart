import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:wins_pkr/utils/utils.dart';
import 'package:wins_pkr/view/mines/controller/mine_controller.dart';
import 'package:wins_pkr/view/mines/repo/mine_cash_out_repo.dart';
import 'package:wins_pkr/view_modal/profile_view_model.dart';
import 'package:wins_pkr/view_modal/user_view_modal.dart';

class MineCashOutViewModel with ChangeNotifier {
  final _mineCashOutRepo = MineCashOutRepository();

  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> mineCashOutApi(dynamic winAmount,dynamic multiplier,int status,context) async {
    final profileViewModel=Provider.of<ProfileViewModel>(context,listen: false);
    final mic=Provider.of<MineController>(context,listen: false);
    setLoading(true);
    UserViewModel userViewModal = UserViewModel();
    String? userId = await userViewModal.getUser();
    Map data = {
      "userid":userId,
      "win_amount":winAmount,
      "multipler":multiplier,
      "status":status.toString()
    };
    _mineCashOutRepo.mineCashOutApi(data).then((value) {
      if (value['status'] == 200) {
        setLoading(false);
        Utils.flushBarSuccessMessage(value['message'].toString(), context);
        profileViewModel.userProfileApi(context);
        if(status==1){
          mic.refreshGame();
        }
      } else {
        setLoading(false);
        Utils.flushBarErrorMessage(
            value['message'].toString(), context);
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }
}