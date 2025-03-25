import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wins_pkr/constants/constant_widgets/audio.dart';
import 'package:wins_pkr/view/wingo/view_model/win_go_game_his_view_model.dart';
import 'package:wins_pkr/view/wingo/view_model/win_go_my_his_view_model.dart';
import 'package:provider/provider.dart';
import 'package:wins_pkr/generated/assets.dart';
import 'package:wins_pkr/utils/utils.dart';
import 'package:wins_pkr/view/wingo/res/win_go_api_url.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:wins_pkr/view/wingo/view_model/win_go_result_view_model.dart';

class WinGoController with ChangeNotifier {
  final TextEditingController amount = TextEditingController(text: "1");

  int _gameIndex = 0;
  int get gameIndex => _gameIndex;

  void setGameTimer(int index) {
    _gameIndex = index;
    notifyListeners();
  }

  int _gameDataTab = 0;
  int get gameDataTab => _gameDataTab;
  setGameDataTab(int value) {
    _gameDataTab = value;
    notifyListeners();
  }

  String _gameHistorySelect = "0";
  String get gameHistorySelect => _gameHistorySelect;
  setGameHistorySelect(String value) {
    _gameHistorySelect = value;
    notifyListeners();
  }

  bool _isSelected = true;

  bool get isSelected => _isSelected;

  void setIsSelected(bool value) {
    _isSelected = value;
    notifyListeners();
  }
  //
  // int _selectedIndexBalance = 0;
  // int get selectedIndexBalance => _selectedIndexBalance;
  // void setSelectedBIndex(int value) {
  //   _selectedIndexBalance = value;
  //   notifyListeners();
  // }
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
  List<GameTimerModel> gameTimerList = [
    GameTimerModel(title: "Win Go", subTitle: "30 Second"),
    GameTimerModel(title: "Win Go", subTitle: "1 Min"),
    GameTimerModel(title: "Win Go", subTitle: "3 Min"),
    GameTimerModel(title: "Win Go", subTitle: "5 Min"),
  ];

  List<dynamic> colorBetList = [
    {"title":"Green","col1":Colors.green,"col2":Colors.green,"game_id":10},
    {"title":"Violet","col1":Colors.purple,"col2":Colors.purple,"game_id":20},
    {"title":"Red","col1":Colors.red,"col2":Colors.red,"game_id":30}
  ];

  List<dynamic> bigSmallList = [
    {"title":"Big","col1":Colors.orange,"col2":Colors.orange,"game_id":40},
    {"title":"Small","col1":Colors.blue,"col2":Colors.blue,"game_id":50},
  ];

  List<dynamic> betNumbers = [
    {"img":Assets.winGo0, "col1":Colors.red, "col2":Colors.purple, "game_id":0,"title":"0"},
    {"img":Assets.winGo1, "col1":Colors.green, "col2":Colors.green, "game_id":1,"title":"1"},
    {"img":Assets.winGo2, "col1":Colors.red, "col2":Colors.red, "game_id":2,"title":"2"},
    {"img":Assets.winGo3, "col1":Colors.green, "col2":Colors.green, "game_id":3,"title":"3"},
    {"img":Assets.winGo4, "col1":Colors.red, "col2":Colors.red, "game_id":4,"title":"4"},
    {"img":Assets.winGo5, "col1":Colors.green, "col2":Colors.purple, "game_id":5,"title":"5"},
    {"img":Assets.winGo6, "col1":Colors.red, "col2":Colors.red, "game_id":6,"title":"6"},
    {"img":Assets.winGo7, "col1":Colors.green, "col2":Colors.green, "game_id":7,"title":"7"},
    {"img":Assets.winGo8, "col1":Colors.red, "col2":Colors.red, "game_id":8,"title":"8"},
    {"img":Assets.winGo9, "col1":Colors.green, "col2":Colors.green, "game_id":9,"title":"9"},
  ];


  List<String> gameDataTabList = [
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

  void decrement() {
    int currentValue = int.tryParse(finalAmount.text) ?? 0;
    if (currentValue > 0) {
      currentValue--;
      finalAmount.text = currentValue.toString();
    }
    notifyListeners();
  }

  void increment() {
    int currentValue = int.tryParse(finalAmount.text) ?? 0;
    currentValue++;
    finalAmount.text = currentValue.toString();
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

  bool resOne=false;

  late IO.Socket _socket;
  void connectToServer(context) {
    final wgr = Provider.of<WinGoResultViewModel>(context, listen: false);
    _socket = IO.io(
      WinGoApiUrl.wingoSocketUrl,
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


    _socket.on(WinGoApiUrl.wingoEventTen, (response) {
      final res = jsonDecode(response);
      set1MinutesData(res['timerBetTime'], res['timerStatus']);
      if(gameIndex==0){
        if(res['timerBetTime']==1&&res['timerStatus']==1){
          resOne=false;
        }
        if(res['timerBetTime']==3&&res['timerStatus']==2&&resOne==false){
          wgr.wingoResultApi(context,1,gameIndex);
          Provider.of<WinGoGameHisViewModel>(context, listen: false).gameHisApi(context, 0);
          Provider.of<WinGoMyHisViewModel>(context, listen: false).myBetHisApi(context, 0);
          // last  five result
          resOne=true;
        }
      }
    });

    _socket.on(WinGoApiUrl.wingoEventOne, (response) {
      final res = jsonDecode(response);
      set3MinutesData(res['timerBetTime'], res['timerStatus']);
      if(gameIndex==1){
        if(res['timerBetTime']==1&&res['timerStatus']==1){
          resOne=false;
        }
        if(res['timerBetTime']==3&&res['timerStatus']==2&&resOne==false){
          wgr.wingoResultApi(context,1,gameIndex);
          Provider.of<WinGoGameHisViewModel>(context, listen: false).gameHisApi(context, 0);
          Provider.of<WinGoMyHisViewModel>(context, listen: false).myBetHisApi(context, 0);
          // last  five result
          resOne=true;
        }
      }
    });

    _socket.on(WinGoApiUrl.wingoEventThree, (response) {
      final res = jsonDecode(response);
      set5MinutesData(res['timerBetTime'], res['timerStatus']);
      if(gameIndex==2){
        if(res['timerBetTime']==1&&res['timerStatus']==1){
          resOne=false;

        }
        if(res['timerBetTime']==3&&res['timerStatus']==2&&resOne==false){
          wgr.wingoResultApi(context,1,gameIndex);
          Provider.of<WinGoGameHisViewModel>(context, listen: false).gameHisApi(context, 0);
          Provider.of<WinGoMyHisViewModel>(context, listen: false).myBetHisApi(context, 0);
          // last  five result
          resOne=true;
        }
      }
    });

    _socket.on(WinGoApiUrl.wingoEventFive, (response) {
      final res = jsonDecode(response);
      set10MinutesData(res['timerBetTime'], res['timerStatus']);
      if(gameIndex==3){
        if(res['timerBetTime']==1&&res['timerStatus']==1){
          resOne=false;
        }
        if(res['timerBetTime']==3&&res['timerStatus']==2&&resOne==false){
          wgr.wingoResultApi(context,1,gameIndex);
          Provider.of<WinGoGameHisViewModel>(context, listen: false).gameHisApi(context, 0);
          Provider.of<WinGoMyHisViewModel>(context, listen: false).myBetHisApi(context, 0);
          // last  five result
          resOne=true;
        }
      }
    });
    _socket.connect();
  }

  bool isPlayAllowed(int time, int status, context) {
    if ((status == 1 && time <= 5) || status == 2) {
      if (kDebugMode) {
        Utils.flushBarErrorMessage("No more bet", context, );
      }
      return false;
    }
    return true;
  }

  void disConnectToServer(context) async {
    _gameIndex=0;
    _socket.disconnect();
    _socket.clearListeners();
    _socket.close();
    Audio.audioPlayers.dispose();
    if (kDebugMode) {
      print('SOCKET DISCONNECT');
    }
  }

  String formatTime(int seconds, int position) {
    final Duration duration = Duration(seconds: seconds);
    final int minutes = duration.inMinutes;
    final int remainingSeconds = duration.inSeconds % 60;

    return position == 0
        ? minutes.toString().padLeft(2, '0')
        : remainingSeconds.toString().padLeft(2, '0');
  }
}


class GameTimerModel{
  String title;
  String subTitle;
  GameTimerModel({required this.title,required this.subTitle});
}