class ShowQrModel {
  String? message;
  int? status;
  Data? data;

  ShowQrModel({this.message, this.status, this.data});

  ShowQrModel.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? name;
  String? qrCode;
  String? walletAddress;
  int? type;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.name,
        this.qrCode,
        this.walletAddress,
        this.type,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    qrCode = json['qr_code'];
    walletAddress = json['wallet_address'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['qr_code'] = qrCode;
    data['wallet_address'] = walletAddress;
    data['type'] = type;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
