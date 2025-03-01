import 'package:flutter/foundation.dart';
import 'package:wins_pkr/model/promotion_model.dart';
import 'package:wins_pkr/repo/promotion_screen_repo.dart';
import 'package:wins_pkr/view_modal/user_view_modal.dart';

class PromotionViewModel with ChangeNotifier {
  final _promotionRepository = PromotionRepository();

  PromotionDataModel? _promotionData;

  PromotionDataModel? get promotionData => _promotionData;

  setPromotionData(PromotionDataModel value) {
    _promotionData = value;
    notifyListeners();
  }

  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> promotionApi(context) async {
    setLoading(true);
    UserViewModel userViewModal = UserViewModel();
    String? userId = await userViewModal.getUser();
    _promotionRepository.promotionApi(userId).then((value) {
      if (value.status == 200) {
        setLoading(false);
        setPromotionData(value);
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
}
