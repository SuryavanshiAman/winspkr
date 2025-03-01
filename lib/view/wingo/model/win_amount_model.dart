class WinAmountModel {
  String? message;
  int? status;
  Data? data;

  WinAmountModel({this.message, this.status, this.data});

  WinAmountModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  dynamic win;
  int? gamesNo;
  String? result;
  int? gameId;
  int? number;

  Data({this.win, this.gamesNo, this.result, this.gameId, this.number});

  Data.fromJson(Map<String, dynamic> json) {
    win = json['win'];
    gamesNo = json['games_no'];
    result = json['result'];
    gameId = json['gameid'];
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['win'] = win;
    data['games_no'] = gamesNo;
    data['result'] = result;
    data['gameid'] = gameId;
    data['number'] = number;
    return data;
  }
}