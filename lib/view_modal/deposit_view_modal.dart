import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wins_pkr/model/deposit_history_model.dart';
import 'package:wins_pkr/repo/deposit_repo.dart';
import 'package:wins_pkr/res/api_urls.dart';
import 'package:wins_pkr/res/launcher.dart';
import 'package:wins_pkr/utils/utils.dart';
import 'package:wins_pkr/view/deposit/widgets/payment.dart';
import 'package:wins_pkr/view_modal/profile_view_model.dart';
import 'package:wins_pkr/view_modal/user_view_modal.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class DepositViewModel with ChangeNotifier {
  final _depositRepository = DepositRepository();

  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  int _selectedCard = 0;
  int get selectedCard => _selectedCard;
  setSelectCard(int value) {
    _selectedCard = value;

    notifyListeners();
  }

  DepositHistoryModel? _depositHistoryData;

  DepositHistoryModel? get depositHistoryData => _depositHistoryData;

  setHistoryData(DepositHistoryModel value) {
    _depositHistoryData = value;
    notifyListeners();
  }

  Future<void> depositHistoryApi(context, dynamic type) async {
    setLoading(true);
    UserViewModel userViewModal = UserViewModel();
    String? userId = await userViewModal.getUser();
    _depositRepository.depositHistoryApi(userId, type).then((value) {
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

  Future<void> payInApi(
      dynamic depositCon, dynamic selectedCard, context) async {
    setLoading(true);
    UserViewModel userViewModal = UserViewModel();
    String? userId = await userViewModal.getUser();
    Map data = {
      "userid": userId,
      "amount": depositCon,
      "type": selectedCard.toString(),
    };
    _depositRepository.depositApi(data).then((value) {
      if (value['status'] == 'SUCCESS') {
        setLoading(false);
        final url = value['payment_link'].toString();
        if (kIsWeb) {
         Launcher.launchOnWeb(context, url);
        } else {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => QRCodeScreen(
                        url: url,
                      )));
        }
      } else {
        setLoading(false);
        Utils.flushBarErrorMessage(
            value['message'].toString(), context);
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }


  Future<void> usdtPayIn(
      dynamic depositCon, dynamic selectedCard, context) async {
    setLoading(true);
    UserViewModel userViewModal = UserViewModel();
    String? userId = await userViewModal.getUser();
    Map data = {
      "user_id": userId,
      "amount": depositCon,
      "type": selectedCard.toString(),
    };
    _depositRepository.usdtPayIn(data).then((value) {
      if (value['status'] == 200) {
        setLoading(false);
        final url = value["data"]['qrcode_url'].toString();
        if (kIsWeb) {
          Launcher.launchOnWeb(context, url);
        } else {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => QRCodeScreen(
                    url: url,
                  )));
        }
      } else {
        setLoading(false);
        Utils.flushBarErrorMessage(
            value['message'].toString(), context);
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }


  mainWalletTransfer(context) async {

    UserViewModel userViewModal = UserViewModel();
    String? userId = await userViewModal.getUser();

    final response = await http.post(
      Uri.parse(ApiUrl.mainWalletTransfer),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "id": userId.toString(),
      }),
    );
    var data = jsonDecode(response.body);
    if (data["status"] == 200) {
      Provider.of<ProfileViewModel>(context, listen: false).userProfileApi(context);

      return Utils.flushBarSuccessMessage(data['message'], context, );
    } else if (data["status"] == 401) {
      Utils.flushBarErrorMessage(data['message'], context, );
    } else {
      Utils.flushBarErrorMessage(data['message'], context, );
    }
  }


  updateMainWallet(context) async {

    UserViewModel userViewModal = UserViewModel();
    String? userId = await userViewModal.getUser();

    final response = await http.post(
      Uri.parse(ApiUrl.updateMainWallet),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "user_id": userId.toString(),
      }),
    );
    var data = jsonDecode(response.body);
    if (data["status"] == 200) {
      Provider.of<ProfileViewModel>(context, listen: false).userProfileApi(context);

      return Utils.flushBarSuccessMessage(data['message'], context, );
    } else if (data["status"] == 401) {
      Utils.flushBarErrorMessage(data['message'], context, );
    } else {
      Utils.flushBarErrorMessage(data['message'], context, );
    }
  }



// _launchURL(String urlGet) async {
  //   var url = urlGet;
  //   if (await canLaunchUrl(Uri.parse(url))) {
  //     await launchUrl(Uri.parse(url));
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }
}
