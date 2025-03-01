class MineBetHisModel {
  dynamic status;
  dynamic message;
  dynamic count;
  List<Data>? data;

  MineBetHisModel({this.status, this.message, this.count, this.data});

  MineBetHisModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    count = json['count'];
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
    data['count'] = count;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  dynamic id;
  dynamic userid;
  dynamic gameId;
  dynamic amount;
  dynamic multiplier;
  dynamic winAmount;
  dynamic status;
  dynamic tax;
  dynamic afterTax;
  dynamic orderId;
  dynamic createdAt;
  dynamic updatedAt;

  Data(
      {this.id,
        this.userid,
        this.gameId,
        this.amount,
        this.multiplier,
        this.winAmount,
        this.status,
        this.tax,
        this.afterTax,
        this.orderId,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userid = json['userid'];
    gameId = json['game_id'];
    amount = json['amount'];
    multiplier = json['multipler'];
    winAmount = json['win_amount'];
    status = json['status'];
    tax = json['tax'];
    afterTax = json['after_tax'];
    orderId = json['order_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userid'] = userid;
    data['game_id'] = gameId;
    data['amount'] = amount;
    data['multipler'] = multiplier;
    data['win_amount'] = winAmount;
    data['status'] = status;
    data['tax'] = tax;
    data['after_tax'] = afterTax;
    data['order_id'] = orderId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
