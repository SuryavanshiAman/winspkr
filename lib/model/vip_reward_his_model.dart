class VipRewardHisModel {
  int? status;
  String? message;
  List<Data>? data;

  VipRewardHisModel({this.status, this.message, this.data});

  VipRewardHisModel.fromJson(Map<String, dynamic> json) {
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
  String? exp;
  String? createdAt;

  Data({this.exp, this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    exp = json['exp'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['exp'] = exp;
    data['created_at'] = createdAt;
    return data;
  }
}
