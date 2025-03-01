import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wins_pkr/repo/auth_repo.dart';
import 'package:wins_pkr/utils/routes/routers_name.dart';
import 'package:wins_pkr/utils/utils.dart';
import 'package:wins_pkr/view_modal/user_view_modal.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier {
  final _authRepository = AuthRepository();

  bool _loadingOne = false;
  bool get loadingOne => _loadingOne;
  setLoadingOne(bool value) {
    _loadingOne = value;
    notifyListeners();
  }

  bool _loadingTwo = false;
  bool get loadingTwo => _loadingTwo;
  setLoadingTwo(bool value) {
    _loadingTwo = value;
    notifyListeners();
  }

  bool _loadingThree = false;
  bool get loadingThree => _loadingThree;
  setLoadingThree(bool value) {
    _loadingThree = value;
    notifyListeners();
  }

  bool _showContainer = false;
  bool get showContainer => _showContainer;
  setShowContainer(bool value) {
    _showContainer = value;
    notifyListeners();
  }

  Future<void> registerApi(dynamic phone, dynamic password, dynamic email, context) async {
    final user = Provider.of<UserViewModel>(context, listen: false);
    Map data = {"mobile": phone, "password": password , "email": email};
    _authRepository.registerApi(data).then((value) async {
      if (value['status'] == 200) {
        setLoadingOne(false);
        user.saveUser(value['data']['id'].toString());
        user.saveBearerToken(value['data']['token'].toString());
        Navigator.pushReplacementNamed(context, RoutesName.bottomNavBar);
        Utils.flushBarSuccessMessage(
          value['message'].toString(),
          context,
        );
      } else {
        setLoadingOne(false);
        Utils.flushBarErrorMessage(
          value['message'].toString(),
          context,
        );
      }
    }).onError((error, stackTrace) {
      setLoadingOne(false);
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }

  Future<void> loginApi(dynamic data, context) async {
    final user = Provider.of<UserViewModel>(context, listen: false);
    setLoadingThree(true);
    _authRepository.loginApi(data).then((value) async {
      if (value['status'] == 200) {
        setLoadingThree(false);
        user.saveUser(value['data']['userId'].toString());
        user.saveBearerToken(value['data']['token'].toString());
        Navigator.pushReplacementNamed(context, RoutesName.bottomNavBar);
        Utils.flushBarSuccessMessage(
          value['message'].toString(),
          context,
        );
      } else {
        setLoadingThree(false);
        Utils.flushBarErrorMessage(
          value['message'].toString(),
          context,
        );
      }
    }).onError((error, stackTrace) {
      setLoadingThree(false);
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }
}
