import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wins_pkr/view/trx/view_model/trx_game_his_view_model.dart';
import 'package:wins_pkr/view/trx/view_model/trx_my_bet_his_view_model.dart';
import 'package:provider/provider.dart';
import 'package:wins_pkr/generated/assets.dart';
import 'package:wins_pkr/utils/utils.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:wins_pkr/view/trx/res/trx_api_url.dart';
import 'package:wins_pkr/view/trx/view_model/trx_result_view_model.dart';

class TrxController with ChangeNotifier {

  final TextEditingController amount = TextEditingController(text: '1');

  int _gameIndex = 0;
  int get gameIndex => _gameIndex;

  void setTrxTimer(int index) {
    _gameIndex = index;
    notifyListeners();
  }

  int _trxDataTab = 0;
  int get trxDataTab => _trxDataTab;
  setGameDataTab(int value) {
    _trxDataTab = value;
    notifyListeners();
  }

  List<String> trxTabList = [
    "Game History",
    "Chart",
    "My History",
  ];
  List<int> balanceList = [
    1,
    10,
    100,
    1000,
  ];
  List<int> multiplierList = [
    1,
    5,
    10,
    20,
    50,
    100,
  ];
  // int _selectedIndexBalance = 0;
  // int get selectedIndexBalance => _selectedIndexBalance;
  // void setSelectedBIndex(int value) {
  //   _selectedIndexBalance = value;
  //   notifyListeners();
  // }
  //
  //
  // int _selectedIndexMultiplier = 0;
  // int get selectedIndexMultiplier => _selectedIndexMultiplier;
  // void setSelectedIndexMultiplier(int value) {
  //   _selectedIndexMultiplier = value;
  //   getXAmount(multiplierList[value]);
  //   notifyListeners();
  // }
  int _selectedIndexBalance = 0;
  int get selectedIndexBalance => _selectedIndexBalance;

  void setSelectedBIndex(int value) {
    print("aman:$value");
    _selectedIndexBalance = value;
    calculateAmount();
    notifyListeners();
  }

  int _selectedIndexMultiplier = 0;
  int get selectedIndexMultiplier => _selectedIndexMultiplier;

  void setSelectedIndexMultiplier(int value) {
    print("shweta:$value");
    _selectedIndexMultiplier = value;
    calculateAmount();
    notifyListeners();
  }
  final TextEditingController finalAmount = TextEditingController(text: "1");

  void calculateAmount() {
    int balanceValue = balanceList[_selectedIndexBalance];
    int multiplierValue = multiplierList[_selectedIndexMultiplier];

    print("AmanShweta: $balanceValue * $multiplierValue");

    // Only update if the value has changed to avoid redundant rebuilds
    String newAmount = (balanceValue * multiplierValue).toString();
    if (amount.text != newAmount) {
      amount.text = newAmount;

      // Move cursor to the end
      amount.selection = TextSelection.fromPosition(
        TextPosition(offset: amount.text.length),
      );
      finalAmount.text=amount.text;
      notifyListeners(); // Notify UI only when there's a change
    }

    print("Updated amount: ${amount.text}");
  }

  void decrement() {
    int currentValue = int.tryParse(amount.text) ?? 0;
    if (currentValue > 0) {
      currentValue--;
      amount.text = currentValue.toString();
    }
    notifyListeners();
  }

  void increment() {
    int currentValue = int.tryParse(amount.text) ?? 0;
    currentValue++;
    amount.text = currentValue.toString();
    notifyListeners();
  }

  void getXAmount(int x) {
    amount.text = (int.parse(amount.text) * x).toString();
    notifyListeners();
  }

  void clear() {
    amount.text = '1';
    _selectedIndexBalance = 0;
    _selectedIndexMultiplier = 0;
    notifyListeners();
  }

  List<TrxTimerModel> trxTimerList = [
    TrxTimerModel(gameId: 6, title: "Trx Win Go", subTitle: "1 Min"),
    TrxTimerModel(gameId: 7, title: "Trx Win Go", subTitle: "3 Min"),
    TrxTimerModel(gameId: 8, title: "Trx Win Go", subTitle: "5 Min"),
    TrxTimerModel(gameId: 9, title: "Trx Win Go", subTitle: "10 Min"),
  ];


  List<TrxComBetModel> colorBetList = [
    TrxComBetModel(gameId: 10, title: 'Green', colFir: Colors.green, colSec: Colors.green),
    TrxComBetModel(gameId: 20, title: 'Violet', colFir: const Color(0xffb658fe), colSec: const Color(0xffb658fe)),
    TrxComBetModel(gameId: 30, title: 'Red', colFir:  Colors.red, colSec: Colors.red),
  ];

  List<TrxComBetModel> bigSmallList = [
    TrxComBetModel(gameId: 40, title: 'Big', colFir: const Color(0xffffa82e), colSec: const Color(0xffffa82e)),
    TrxComBetModel(gameId: 50, title: 'Small', colFir: const Color(0xff6ab5fe), colSec: const Color(0xff6ab5fe)),
  ];
  List<TrxComBetModel> betNumbers = [
    TrxComBetModel(img:Assets.trx0,gameId: 0, title: '0', colFir: Colors.red, colSec: Colors.purple),
    TrxComBetModel(img:Assets.trx1,gameId: 1, title: '1', colFir: Colors.green, colSec: Colors.green),
    TrxComBetModel(img:Assets.trx2,gameId: 2, title: '2', colFir: Colors.red, colSec: Colors.red),
    TrxComBetModel(img:Assets.trx3,gameId: 3, title: '3', colFir: Colors.green, colSec: Colors.green),
    TrxComBetModel(img:Assets.trx4,gameId: 4, title: '4', colFir: Colors.red, colSec: Colors.red),
    TrxComBetModel(img:Assets.trx5,gameId: 5, title: '5', colFir: Colors.green, colSec: Colors.purple),
    TrxComBetModel(img:Assets.trx6,gameId: 6, title: '6', colFir: Colors.red, colSec: Colors.red),
    TrxComBetModel(img:Assets.trx7,gameId: 7, title: '7', colFir: Colors.green, colSec: Colors.green),
    TrxComBetModel(img:Assets.trx8,gameId: 8, title: '8', colFir: Colors.red, colSec: Colors.red),
    TrxComBetModel(img:Assets.trx9,gameId: 9, title: '9', colFir: Colors.green, colSec: Colors.green),
  ];


  int _oneMinuteTime = 0;
  int get oneMinuteTime => _oneMinuteTime;
  int _oneMinuteStatus = 0;
  int get oneMinuteStatus => _oneMinuteStatus;
  set1MinutesData(int time, int status) {
    _oneMinuteTime = time;
    _oneMinuteStatus = status;
    notifyListeners();
  }

  int _threeMinuteTime = 0;
  int get threeMinuteTime => _threeMinuteTime;
  int _threeMinuteStatus = 0;
  int get threeMinuteStatus => _threeMinuteStatus;
  set3MinutesData(int time, int status) {
    _threeMinuteTime = time;
    _threeMinuteStatus = status;
    notifyListeners();
  }

  int _fiveMinuteTime = 0;
  int get fiveMinuteTime => _fiveMinuteTime;
  int _fiveMinuteStatus = 0;
  int get fiveMinuteStatus => _fiveMinuteStatus;
  set5MinutesData(int time, int status) {
    _fiveMinuteTime = time;
    _fiveMinuteStatus = status;
    notifyListeners();
  }

  int _tenMinuteTime = 0;
  int get tenMinuteTime => _tenMinuteTime;
  int _tenMinuteStatus = 0;
  int get tenMinuteStatus => _tenMinuteStatus;
  set10MinutesData(int time, int status) {
    _tenMinuteTime = time;
    _tenMinuteStatus = status;
    notifyListeners();
  }

  bool resOne = false;

  late IO.Socket _socket;
  void connectToServer(context) {
    final trc = Provider.of<TrxResultViewModel>(context, listen: false);
    _socket = IO.io(
      TrxApiUrl.trxSocketUrl,
      IO.OptionBuilder().setTransports(['websocket']).build(),
    );

    _socket.on('connect', (_) {
      if (kDebugMode) {
        print("Connected");
      }
    });

    _socket.onConnectError((data) {
      if (kDebugMode) {
        print("Connection error $data");
      }
    });

    _socket.on(TrxApiUrl.trxEvent30, (response) {
      final res = jsonDecode(response);
      set1MinutesData(res['timerBetTime'], res['timerStatus']);
      if (gameIndex == 0) {
        if (res['timerBetTime'] == 1 && res['timerStatus'] == 1) {
          resOne = false;
        }
        if (res['timerBetTime'] == 3 &&
            res['timerStatus'] == 2 &&
            resOne == false) {
          trc.trxResultApi(context,1);
          Provider.of<TrxGameHisViewModel>(context, listen: false).trxGameHisApi(context, 0);
          Provider.of<TrxMyBetHisViewModel>(context, listen: false).trxMyBetHisApi(context, 0);
          // last  five result
          resOne = true;
        }
      }
    });

    _socket.on(TrxApiUrl.trxEvent1, (response) {
      final res = jsonDecode(response);
      set3MinutesData(res['timerBetTime'], res['timerStatus']);
      if (gameIndex == 1) {
        if (res['timerBetTime'] == 1 && res['timerStatus'] == 1) {
          resOne = false;
        }
        if (res['timerBetTime'] == 3 &&
            res['timerStatus'] == 2 &&
            resOne == false) {
          trc.trxResultApi(context,1);
          // last  five result
          Provider.of<TrxGameHisViewModel>(context, listen: false).trxGameHisApi(context, 0);
          Provider.of<TrxMyBetHisViewModel>(context, listen: false).trxMyBetHisApi(context, 0);
          resOne = true;
        }
      }
    });

    _socket.on(TrxApiUrl.trxEvent3, (response) {
      final res = jsonDecode(response);
      set5MinutesData(res['timerBetTime'], res['timerStatus']);
      if (gameIndex == 2) {
        if (res['timerBetTime'] == 1 && res['timerStatus'] == 1) {
          resOne = false;
        }
        if (res['timerBetTime'] == 3 &&
            res['timerStatus'] == 2 &&
            resOne == false) {
          trc.trxResultApi(context,1);
          // last  five result
          Provider.of<TrxGameHisViewModel>(context, listen: false).trxGameHisApi(context, 0);
          Provider.of<TrxMyBetHisViewModel>(context, listen: false).trxMyBetHisApi(context, 0);
          resOne = true;
        }
      }
    });

    _socket.on(TrxApiUrl.trxEvent5, (response) {
      final res = jsonDecode(response);
      set10MinutesData(res['timerBetTime'], res['timerStatus']);
      if (gameIndex == 3) {
        if (res['timerBetTime'] == 1 && res['timerStatus'] == 1) {
          resOne = false;
        }
        if (res['timerBetTime'] == 3 &&
            res['timerStatus'] == 2 &&
            resOne == false) {
          trc.trxResultApi(context,1);
          // last  five result
          Provider.of<TrxGameHisViewModel>(context, listen: false).trxGameHisApi(context, 0);
          Provider.of<TrxMyBetHisViewModel>(context, listen: false).trxMyBetHisApi(context, 0);
          resOne = true;
        }
      }
    });
    _socket.connect();
  }

  void disConnectToServer(context) async {
    _gameIndex = 0;
    _socket.disconnect();
    _socket.clearListeners();
    _socket.close();
    if (kDebugMode) {
      print('SOCKET DISCONNECT');
    }
  }

  bool isPlayAllowed(int time, int status, context) {
    if ((status == 1 && time <= 5) || status == 2) {
      if (kDebugMode) {
        Utils.flushBarErrorMessage(
          "No more bet",
          context,
        );
      }
      return false;
    }
    return true;
  }
}

class TrxTimerModel {
  int gameId;
  String title;
  String subTitle;
  TrxTimerModel(
      {required this.gameId, required this.title, required this.subTitle});
}

class TrxComBetModel {
  String? img;
  int gameId;
  String title;
  Color colFir;
  Color colSec;
  TrxComBetModel(
      {this.img,
      required this.gameId,
      required this.title,
      required this.colFir,
      required this.colSec});
}
