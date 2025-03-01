import 'package:flutter/foundation.dart';
import 'package:wins_pkr/model/payment_mode_model.dart';
import 'package:wins_pkr/repo/paymode_repo.dart';

class PaymodeViewModel with ChangeNotifier {
  final _paymodeRepository = PaymodeRepository();

  int _selectedCard = 0;
  int get selectedCard => _selectedCard;
  setSelectCard(int value) {
    _selectedCard = value;

    notifyListeners();
  }

  PaymentModeModel? _paymodeData;

  PaymentModeModel? get paymodeData => _paymodeData;

  setPaymodeData(PaymentModeModel value) {
    _paymodeData = value;
    notifyListeners();
  }

  Future<void> payModeApi(context) async {
    _paymodeRepository.payModeApi().then((value) {
      if (value.status == '400') {
        setPaymodeData(value);
      } else {}
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }
}
