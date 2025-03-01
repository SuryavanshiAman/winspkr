import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:wins_pkr/model/subordinate_tier_model.dart';
import 'package:wins_pkr/repo/subordinate_tier_repo.dart';
import 'package:wins_pkr/utils/utils.dart';
import 'package:wins_pkr/view_modal/subordinate_data_view_model.dart';

class SubordinateTierViewModel with ChangeNotifier {
  final _subordinateTierRepo = SubordinateTierRepository();

  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  SubordinateTierModel? _tierModelData;

  SubordinateTierModel? get tierModelData => _tierModelData;

  setListData(SubordinateTierModel value) {
    _tierModelData = value;
    notifyListeners();
  }

  Future<void> subordinateTierApi(context) async {
    setLoading(true);
    final subData = Provider.of<SubordinateDataViewModel>(context, listen: false);
    _subordinateTierRepo.subordinateTierApi().then((value) {
      if (value.status == 200) {
        setLoading(false);
        setListData(value);
        subData.subordinateTierApi(
            context, '${value.data![subData.selectedTier].id}',0);
      } else {
        setLoading(false);
        Utils.flushBarSuccessMessage(value.message.toString(), context);
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }
}