import 'package:flutter/foundation.dart';
import 'package:wins_pkr/model/customer_service_model.dart';
import 'package:wins_pkr/repo/customer_service_repo.dart';
import 'package:wins_pkr/utils/utils.dart';

class CustomerServiceViewModel with ChangeNotifier {
  final _customerServiceRepo = CustomerServiceRepo();

  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  CustomerServiceModel? _customerServiceModel;

  CustomerServiceModel? get customerServiceModel => _customerServiceModel;

  setListData(CustomerServiceModel value) {
    _customerServiceModel = value;
    notifyListeners();
  }

  Future<void> customerServiceApi(context) async {
    setLoading(true);
    _customerServiceRepo.customerServiceApi().then((value) {
      if (value.status == 200) {
        setLoading(false);
        setListData(value);
      } else {
        setLoading(false);

        Utils.flushBarSuccessMessage(
          value.message.toString(),
          context,
        );
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }
}
