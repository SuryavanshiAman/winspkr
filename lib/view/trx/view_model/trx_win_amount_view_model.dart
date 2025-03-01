import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wins_pkr/view/trx/model/trx_win_amount_model.dart';
import 'package:wins_pkr/view/trx/repo/trx_win_amount_repo.dart';
import 'package:wins_pkr/view/trx/widgets/trx_loss_pop_up.dart';
import 'package:wins_pkr/view/trx/widgets/trx_win_pop_up.dart';
import 'package:wins_pkr/view_modal/profile_view_model.dart';
import 'package:wins_pkr/view_modal/user_view_modal.dart';
import 'package:provider/provider.dart';

class TrxWinAmountViewModel with ChangeNotifier {
  final _trxWinAmountRepo = TrxWinAmountRepository();

  bool _loadingGameWin = false;
  bool get loadingGameWin => _loadingGameWin;
  setLoadingGameWin(bool value) {
    _loadingGameWin = value;
    notifyListeners();
  }

  TrxWinAmountModel? _trxWinAmountData;
  TrxWinAmountModel? get trxWinAmountData => _trxWinAmountData;
  setWinAmountData(TrxWinAmountModel value, context) {
    _trxWinAmountData = value;
    notifyListeners();
  }

  Future<void> trxWinAmountApi(context, String gameId, dynamic period) async {
    setLoadingGameWin(true);
    UserViewModel userViewModal = UserViewModel();
    String? userId = await userViewModal.getUser();
    _trxWinAmountRepo.trxWinAmountApi(userId, gameId, period).then((value) {
      if (value.status == 200) {
        setLoadingGameWin(false);
        setWinAmountData(value, context);
        if (value.data!.win != 0) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return TrxWinPopUp(
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
              return TrxLossPopUp(
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