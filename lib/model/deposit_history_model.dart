class DepositHistoryModel {
  String? message;
  int? status;
  List<Data>? data;

  DepositHistoryModel({this.message, this.status, this.data});

  DepositHistoryModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? cash;
  int? type;
  int? status;
  String? orderId;
  String? typeimages;
  String? createdAt;

  Data(
      {this.cash,
        this.type,
        this.status,
        this.orderId,
        this.typeimages,
        this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    cash = json['cash'];
    type = json['type'];
    status = json['status'];
    orderId = json['order_id'];
    typeimages = json['typeimages'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cash'] = cash;
    data['type'] = type;
    data['status'] = status;
    data['order_id'] = orderId;
    data['typeimages'] = typeimages;
    data['created_at'] = createdAt;
    return data;
  }
}
