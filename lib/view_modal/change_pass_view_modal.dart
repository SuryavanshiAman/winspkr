import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wins_pkr/repo/change_pass_repo.dart';
import 'package:wins_pkr/utils/routes/routers_name.dart';
import 'package:wins_pkr/utils/utils.dart';
import 'package:wins_pkr/view_modal/user_view_modal.dart';


class ChangePasswordViewModel with ChangeNotifier{
  final  _changePassRepository = ChangePassRepository();

  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }


  Future<void> changePassApi( dynamic password,dynamic newPassword,dynamic confirmPass, context) async {
    setLoading(true);
    UserViewModel userViewModal=UserViewModel();
    String?userId=await userViewModal.getUser();
    Map data = {
      "userid":userId,
      "password":password,
      "newpassword":newPassword,
      "confirm_newpassword":confirmPass,
    };
    _changePassRepository.changePassApi(data).then((value) {
      if (value['status'] == "200") {
        setLoading(false);
        // Navigator.pushReplacementNamed(context, RoutesName.login);
        Utils.flushBarSuccessMessage(value['message'].toString(), context,);
      } else {
        setLoading(false);
        Utils.flushBarErrorMessage(value['message'].toString(), context,);
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }


}