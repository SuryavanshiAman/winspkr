class MineDropDownModel {
  int? status;
  List<Data>? data;

  MineDropDownModel({this.status, this.data});

  MineDropDownModel.fromJson(Map<String, dynamic> json) {
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
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  dynamic multiplier;

  Data({this.id, this.name, this.multiplier});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    multiplier = json['multiplier'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['multiplier'] = multiplier;
    return data;
  }
}
