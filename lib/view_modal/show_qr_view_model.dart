import 'package:flutter/foundation.dart';
import 'package:wins_pkr/model/show_qr_model.dart';
import 'package:wins_pkr/repo/show_qr_repo.dart';
import 'package:wins_pkr/utils/utils.dart';
import 'package:wins_pkr/view_modal/user_view_modal.dart';

class ShowQrViewModel with ChangeNotifier {
  final _showQrRepository = ShowQrRepository();

  ShowQrModel? _showQrData;

  ShowQrModel? get showQrData => _showQrData;

  setShowQrData(ShowQrModel value) {
    _showQrData = value;
    notifyListeners();
  }

  Future<void> showQrApi(dynamic type,context) async {
    _showQrRepository.showQrApi(type).then((value) {
      if (value.status == 200) {
        setShowQrData(value);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }

  ///
  bool _loadingOne = false;
  bool get loadingOne => _loadingOne;
  setLoadingOne(bool value) {
    _loadingOne = value;
    notifyListeners();
  }
  Future<void> usdtAccountViewApi(dynamic cashCont,dynamic type, dynamic screenshot, context) async {
    UserViewModel userViewModal = UserViewModel();
    String? userId = await userViewModal.getUser();
    setLoadingOne(true);
    Map data = {
      "user_id":userId.toString(),
      "cash":cashCont,
      "type":type,
      "screenshot":screenshot
    };
    _showQrRepository.usdtAccountViewApi(data).then((value) async {
      if (value['status'] == 200) {
        setLoadingOne(false);
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
}
