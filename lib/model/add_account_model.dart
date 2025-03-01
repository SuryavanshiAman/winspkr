class AddAccountModel {
  String? status;
  String? message;
  List<Data>? data;

  AddAccountModel({this.status, this.message, this.data});

  AddAccountModel.fromJson(Map<String, dynamic> json) {
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
  int? id;
  int? userid;
  String? name;
  String? accountNum;
  String? bankName;
  String? ifscCode;
  String? status;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.userid,
        this.name,
        this.accountNum,
        this.bankName,
        this.ifscCode,
        this.status,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userid = json['userid'];
    name = json['name'];
    accountNum = json['account_num'];
    bankName = json['bank_name'];
    ifscCode = json['ifsc_code'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userid'] = userid;
    data['name'] = name;
    data['account_num'] = accountNum;
    data['bank_name'] = bankName;
    data['ifsc_code'] = ifscCode;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
