class WinGoMyHisModel {
  int? status;
  String? message;
  int? totalBets;
  List<Data>? data;

  WinGoMyHisModel({this.status, this.message, this.totalBets, this.data});

  WinGoMyHisModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    totalBets = json['total_bets'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['total_bets'] = totalBets;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  dynamic id;
  dynamic amount;
  dynamic commission;
  dynamic tradeAmount;
  dynamic winAmount;
  int? number;
  dynamic winNumber;
  dynamic gamesNo;
  dynamic gameId;
  dynamic userid;
  dynamic orderId;
  dynamic status;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic gameName;
  dynamic virtualGameName;

  Data(
      {this.id,
        this.amount,
        this.commission,
        this.tradeAmount,
        this.winAmount,
        this.number,
        this.winNumber,
        this.gamesNo,
        this.gameId,
        this.userid,
        this.orderId,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.gameName,
        this.virtualGameName});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amount = json['amount'];
    commission = json['commission'];
    tradeAmount = json['trade_amount'];
    winAmount = json['win_amount'];
    number = json['number'];
    winNumber = json['win_number'];
    gamesNo = json['games_no'];
    gameId = json['game_id'];
    userid = json['userid'];
    orderId = json['order_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    gameName = json['game_name'];
    virtualGameName = json['virtual_game_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['amount'] = amount;
    data['commission'] = commission;
    data['trade_amount'] = tradeAmount;
    data['win_amount'] = winAmount;
    data['number'] = number;
    data['win_number'] = winNumber;
    data['games_no'] = gamesNo;
    data['game_id'] = gameId;
    data['userid'] = userid;
    data['order_id'] = orderId;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['game_name'] = gameName;
    data['virtual_game_name'] = virtualGameName;
    return data;
  }
}
