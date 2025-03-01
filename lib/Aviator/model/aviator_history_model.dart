class AviatorHistoryModel {
  int? status;
  String? message;
  List<Data>? data;

  AviatorHistoryModel({this.status, this.message, this.data});

  AviatorHistoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
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
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  dynamic id;
  dynamic uid;
  dynamic amount;
  dynamic stopMultiplier;
  dynamic gameId;
  dynamic totalamount;
  dynamic number;
  dynamic subNumber;
  dynamic color;
  dynamic gameSrNum;
  dynamic commission;
  dynamic resultStatus;
  dynamic win;
  dynamic multiplier;
  dynamic status;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic cashoutAmount;
  double? crashPoint;

  Data(
      {this.id,
      this.uid,
      this.amount,
      this.stopMultiplier,
      this.gameId,
      this.totalamount,
      this.number,
      this.subNumber,
      this.color,
      this.gameSrNum,
      this.commission,
      this.resultStatus,
      this.win,
      this.multiplier,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.cashoutAmount,
      this.crashPoint});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    amount = json['amount'];
    stopMultiplier = json['stop_multiplier'];
    gameId = json['game_id'];
    totalamount = json['totalamount'];
    number = json['number'];
    subNumber = json['sub_number'];
    color = json['color'];
    gameSrNum = json['game_sr_num'];
    commission = json['commission'];
    resultStatus = json['result_status'];
    win = json['win'];
    multiplier = json['multiplier'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    cashoutAmount = json['cashout_amount'];
    crashPoint = json['crash_point'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['uid'] = uid;
    data['amount'] = amount;
    data['stop_multiplier'] = stopMultiplier;
    data['game_id'] = gameId;
    data['totalamount'] = totalamount;
    data['number'] = number;
    data['sub_number'] = subNumber;
    data['color'] = color;
    data['game_sr_num'] = gameSrNum;
    data['commission'] = commission;
    data['result_status'] = resultStatus;
    data['win'] = win;
    data['multiplier'] = multiplier;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['cashout_amount'] = cashoutAmount;
    data['crash_point'] = crashPoint;
    return data;
  }
}
