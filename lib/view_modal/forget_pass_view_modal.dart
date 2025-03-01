import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wins_pkr/repo/forget_pass_repo.dart';
import 'package:wins_pkr/utils/routes/routers_name.dart';
import 'package:wins_pkr/utils/utils.dart';

class ForgetPassViewModel with ChangeNotifier {
  final _forgetPassRepository = ForgetPassRepository();

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

  bool _isOtpSend = false;
  bool get isOtpSend => _isOtpSend;
  setIsOtpSend(bool value) {
    _isOtpSend = value;
    notifyListeners();
  }

  bool _showPasswordFields = false;
  bool get showPasswordFields => _showPasswordFields;
  setShowPasswordFields(bool value) {
    _showPasswordFields = value;
    notifyListeners();
  }

  Future<void> sendOtp(dynamic phoneNumber, context) async {
    _forgetPassRepository.sendOtp(phoneNumber).then((value) {
      if (value['error'] == "200") {
        setIsOtpSend(true);
        setLoadingOne(false);
        Utils.flushBarSuccessMessage(
          value['msg'].toString(),
          context,
        );
      } else {
        setLoadingOne(false);
        Utils.flushBarErrorMessage(
          value['msg'].toString(),
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

  // Future<void> verifyOtp(
  //     dynamic data, dynamic password, context) async {
  //   setLoadingOne(true);
  //   _forgetPassRepository.verifyOtp(data).then((value) {
  //     if (value['error'] == "200") {
  //     } else {
  //       setLoadingOne(false);
  //       Utils.flushBarSuccessMessage(
  //         value['message'].toString(),
  //         context,
  //       );
  //     }
  //   }).onError((error, stackTrace) {
  //     setLoadingOne(false);
  //     if (kDebugMode) {
  //       print('error: $error');
  //     }
  //   });
  // }

  Future<void> forgetPassApi(
      dynamic phone, dynamic password, dynamic confirmPass, context) async {
    setLoadingTwo(true);
    Map data = {
      "mobile": phone,
      "password": password,
      "confirm_password": confirmPass
    };
    _forgetPassRepository.forgetPassApi(data).then((value) {
      if (value['status'] == 200) {
        sendOtp(phone.toString(), context);
      } else {
        setLoadingTwo(false);
        Navigator.pushReplacementNamed(context, RoutesName.login);
        Utils.flushBarSuccessMessage(
          value['message'].toString(),
          context,
        );
      }
    }).onError((error, stackTrace) {
      setLoadingTwo(false);
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }
}
