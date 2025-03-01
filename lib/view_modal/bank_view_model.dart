import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wins_pkr/model/add_account_model.dart';
import 'package:wins_pkr/repo/bank_repo.dart';
import 'package:wins_pkr/utils/utils.dart';
import 'package:wins_pkr/view_modal/user_view_modal.dart';

class BankViewModel with ChangeNotifier {
  final _bankRepository = BankRepository();

  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  bool _deleteLoading = false;
  bool get deleteLoading => _deleteLoading;
  setDeleteLoading(bool value) {
    _deleteLoading = value;
    notifyListeners();
  }

  AddAccountModel? _bankDataModel;
  AddAccountModel? get bankDataModel => _bankDataModel;
  setListData(AddAccountModel value) {
    _bankDataModel = value;
    notifyListeners();
  }

  Future<void> accountViewApi(context) async {
    setLoading(true);
    UserViewModel userViewModal = UserViewModel();
    String? userId = await userViewModal.getUser();
    _bankRepository.accountViewApi(userId).then((value) {
      if (value.status == "200") {
        setLoading(false);
        setListData(value);
      } else {
        setLoading(false);
        setListData(AddAccountModel(status: '400', message: "ff", data: []));
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }

  Future<void> addBankApi(dynamic name, dynamic accountNum, dynamic bankName, dynamic ifsc, context) async {
    setLoading(true);
    UserViewModel userViewModal = UserViewModel();
    String? userId = await userViewModal.getUser();
    Map data = {
      "userid": userId,
      "name": name,
      "account_number": accountNum,
      "bank_name": bankName,
      "ifsc_code": ifsc,
    };
    _bankRepository.addBankApi(data).then((value) {
      if (value['status'] == "200") {
        setLoading(false);
        accountViewApi(context);
        Navigator.pop(context);
        Utils.flushBarSuccessMessage(
            value['message'].toString(), context, );
      } else {
        setLoading(false);
        Utils.flushBarErrorMessage(
            value['message'].toString(), context, );
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }

  Future<void> deleteAccountApi(context , String id) async {
    setDeleteLoading(true);
    _bankRepository.deleteAccountApi(id).then((value) {
      if (value['status'] == "200") {
        setLoading(false);
        Utils.flushBarSuccessMessage(
            value['message'].toString(), context, );
        accountViewApi(context);
      } else {
        setDeleteLoading(false);
        Utils.flushBarErrorMessage(
            value['message'].toString(), context, );
      }
    }).onError((error, stackTrace) {
      setDeleteLoading(false);
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }

}
