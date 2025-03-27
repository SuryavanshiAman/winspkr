import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wins_pkr/utils/utils.dart';
import 'package:wins_pkr/view/mines/repo/mine_bet_repo.dart';
import 'package:wins_pkr/view_modal/profile_view_model.dart';
import 'package:wins_pkr/view_modal/user_view_modal.dart';

import '../../../utils/routes/routers_name.dart';

class MineBetViewModel with ChangeNotifier {
  final _mineBetRepo = MineBetRepository();

  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> mineBetApi(dynamic amount,context) async {
    final profileViewModel=Provider.of<ProfileViewModel>(context,listen: false);
    setLoading(true);
    UserViewModel userViewModal = UserViewModel();
    String? userId = await userViewModal.getUser();
    print("🎉🎉🎉🎉");
    Map data = {
      "game_id":"12",
      "userid":userId,
      "amount":amount
    };
    _mineBetRepo.mineBetApi(data).then((value) {
      if (value['status'] == 200) {
        setLoading(false);
        Utils.flushBarSuccessMessage(value['message'].toString(), context);
        profileViewModel.userProfileApi(context);
      } else if(value["status"] == 403){
        Utils.flushBarErrorMessage( data['message'].toString(), context);
        Navigator.pushReplacementNamed(context, RoutesName.login);
      }
      else {
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