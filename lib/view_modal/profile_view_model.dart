


import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wins_pkr/model/profile_model.dart';
import 'package:wins_pkr/repo/profile_repo.dart';
import 'package:wins_pkr/utils/routes/routers_name.dart';
import 'package:wins_pkr/view/auth/login_page.dart';
import 'package:wins_pkr/view_modal/user_view_modal.dart';

import '../plinko/routes.dart';
import '../utils/utils.dart';

class ProfileViewModel with ChangeNotifier {
  final _userProfileRepository = UserProfileRepository();

  dynamic _balance = 0;

  dynamic get balance => _balance;

  void addBalance(dynamic amount) {
    _balance += amount;
    notifyListeners();
  }

  void deductBalance(dynamic amount) {
    _balance -= amount;
    notifyListeners();
  }

  void setBalance(dynamic amount) {
    _balance = amount;
    notifyListeners();
  }

  ProfileModel? _setProfileData;
  ProfileModel? get profileData => _setProfileData;

  setProfile(ProfileModel value) {
    _setProfileData = value;
    notifyListeners();
  }

  Future<void> userProfileApi(context) async {
    UserViewModel userViewModal = UserViewModel();
    String? userId = await userViewModal.getUser();
    _userProfileRepository.userProfileApi(userId).then((value) {
      if (value.success == 200) {
        setBalance(value.data!.wallet);
        setProfile(value);
      } else if(value.success == 403){
        print('value: ${value.message}');
        // Navigator.of(context, rootNavigator: true).pop();
        Navigator.pushReplacementNamed(context, RoutesName.login);
        Utils.flushBarErrorMessage(value.message??"", context);
      }else  {
        if (kDebugMode) {
          print('value: ${value.message}');
        }
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print('UserProfileViewModel: $error');
      }
    });
  }
}
