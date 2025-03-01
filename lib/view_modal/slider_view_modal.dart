import 'package:flutter/foundation.dart';
import 'package:wins_pkr/model/slider_modal.dart';
import 'package:wins_pkr/repo/slider_repo.dart';
import 'package:wins_pkr/utils/utils.dart';

class SliderViewModel with ChangeNotifier {
  final _sliderRepository = SliderRepository();

  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  SliderModel? _sliderModelData;

  SliderModel ?get sliderModelData => _sliderModelData;

  setListData(SliderModel value) {
    _sliderModelData = value;
    notifyListeners();
  }

  Future<void> sliderApi(context) async {
    setLoading(true);
    _sliderRepository.sliderApi().then((value) {
      if (value.success == 200) {
        setLoading(false);
        setListData(value);
      } else {
        setLoading(false);

        Utils.flushBarSuccessMessage(value.message.toString(), context,);
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }
}