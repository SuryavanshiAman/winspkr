import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wins_pkr/model/withdraw_history_model.dart';
import 'package:wins_pkr/repo/withdraw_repo.dart';
import 'package:wins_pkr/utils/utils.dart';
import 'package:wins_pkr/view_modal/profile_view_model.dart';
import 'package:wins_pkr/view_modal/user_view_modal.dart';

class WithdrawViewModel with ChangeNotifier {
  final _withdrawRepository = WithdrawRepository();

  TextEditingController withdrawCon = TextEditingController();
  TextEditingController usdtAddress = TextEditingController();
  TextEditingController usdtAmount = TextEditingController();

  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  int _selectedBank = 0;
  int get selectedBank => _selectedBank;
  setSelectedBank(int value) {
    _selectedBank = value;
    notifyListeners();
  }

  int _selectedCard = 0;
  int get selectedCard => _selectedCard;
  setSelectCard(int value) {
    _selectedCard = value;

    notifyListeners();
  }

  double _inconvenienceFee = 0.00;
  double get inconvenienceFee => _inconvenienceFee;
  void setGetWithdraw(double value) {
    _inconvenienceFee = value * 0 / 100;
    notifyListeners();
  }

  WithdrawHistoryModel? _withdrawHistoryData;
  WithdrawHistoryModel? get withdrawHistoryData => _withdrawHistoryData;
  setHistoryData(WithdrawHistoryModel value) {
    _withdrawHistoryData = value;
    notifyListeners();
  }

  Future<void> withdrawHistoryApi(context, dynamic type) async {
    setLoading(true);
    UserViewModel userViewModal = UserViewModel();
    String? userId = await userViewModal.getUser();
    _withdrawRepository.withdrawHistoryApi(userId, type).then((value) {
      if (value.status == 200) {
        setLoading(false);
        setHistoryData(value);
      } else {
        setLoading(false);
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }

  void clearCon() {
    withdrawCon.clear();
    notifyListeners();
  }

  Future<void> withdrawApi(
      dynamic withdrawCon, dynamic accountId, dynamic type, context) async {
    setLoading(true);
    final profileViewModel =
        Provider.of<ProfileViewModel>(context, listen: false);
    UserViewModel userViewModal = UserViewModel();
    String? userId = await userViewModal.getUser();
    Map data = {
      "user_id": userId,
      "account_id": accountId,
      "type": type,
      "amount": withdrawCon,
    };
    _withdrawRepository.withdrawApi(data).then((value) {
      if (value['status'] == 200) {
        setLoading(false);
        clearCon();
        profileViewModel.userProfileApi(context);
        Utils.flushBarSuccessMessage(value['message'].toString(), context);
      } else {
        setLoading(false);
        Utils.flushBarErrorMessage(value['message'].toString(), context);
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }
}
