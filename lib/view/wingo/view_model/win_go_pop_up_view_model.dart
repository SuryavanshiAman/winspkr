import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wins_pkr/view/wingo/model/win_amount_model.dart';
import 'package:wins_pkr/view/wingo/repo/win_go_pop_up_repo.dart';
import 'package:wins_pkr/view/wingo/widgets/loss_pop_up.dart';
import 'package:wins_pkr/view/wingo/widgets/win_pop_up.dart';
import 'package:wins_pkr/view_modal/profile_view_model.dart';
import 'package:wins_pkr/view_modal/user_view_modal.dart';
import 'package:provider/provider.dart';

class WinGoPopUpViewModel with ChangeNotifier {
  final _winGoPopUpRepo = WinGoPopUpRepository();

  bool _loadingGameWin = false;
  bool get loadingGameWin => _loadingGameWin;
  setLoadingGameWin(bool value) {
    _loadingGameWin = value;
    notifyListeners();
  }

  WinAmountModel? _winAmountData;
  WinAmountModel? get winAmountData => _winAmountData;
  setWinAmountData(WinAmountModel value, context) {
    _winAmountData = value;
    notifyListeners();
  }

  Future<void> winAmountApi(context, String gameId, dynamic period) async {
    setLoadingGameWin(true);
    UserViewModel userViewModal = UserViewModel();
    String? userId = await userViewModal.getUser();
    _winGoPopUpRepo.winAmountApi(userId, gameId, period).then((value) {
      if (value.status == 200) {
        setLoadingGameWin(false);
        setWinAmountData(value, context);
        if (value.data!.win != 0) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return WinPopUpPage(
                winNumber: value.data!.number!,
                winAmount: value.data!.win.toString(),
                gameSrNo: value.data!.gamesNo!,
                gameId: value.data!.gameId!,
                result: value.data!.result.toString(),
              );
            },
          );
          Provider.of<ProfileViewModel>(context, listen: false).userProfileApi(context);

        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return LossPopUpPage(
                winNumber: value.data!.number!,
                winAmount: value.data!.win!,
                gameSrNo: value.data!.gamesNo!,
                gameId: value.data!.gameId!,
                result: value.data!.result.toString(),
              );
            },
          );
        }
        Provider.of<ProfileViewModel>(context, listen: false).userProfileApi(context);

      } else {
        if (kDebugMode) {
          print('Bet not place in this period no!');
        }
      }
    }).onError((error, stackTrace) {
      setLoadingGameWin(false);
      if (kDebugMode) {
        print('Error: $error');
      }
    });
  }
}
