class PaymentModeModel {
  String? msg;
  List<Data>? data;
  int? minimum;
  String? status;

  PaymentModeModel({this.msg, this.data, this.minimum, this.status});

  PaymentModeModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    minimum = json['minimum'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['minimum'] = minimum;
    data['status'] = status;
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? image;
  int? status;
  String? type;

  Data({this.id, this.name, this.image, this.status, this.type});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    status = json['status'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['status'] = status;
    data['type'] = type;
    return data;
  }
}
