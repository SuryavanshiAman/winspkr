class TrxGameHisModel {
  int? status;
  String? message;
  int? totalResult;
  List<Data>? data;

  TrxGameHisModel({this.status, this.message, this.totalResult, this.data});

  TrxGameHisModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    totalResult = json['total_result'];
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
    data['total_result'] = totalResult;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? number;
  int? gamesNo;
  int? gameId;
  String? jsonData;
  String? randomCard;
  String? token;
  int? block;
  int? status;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.number,
        this.gamesNo,
        this.gameId,
        this.jsonData,
        this.randomCard,
        this.token,
        this.block,
        this.status,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    number = json['number'];
    gamesNo = json['games_no'];
    gameId = json['game_id'];
    jsonData = json['json'];
    randomCard = json['random_card'];
    token = json['token'];
    block = json['block'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['number'] = number;
    data['games_no'] = gamesNo;
    data['game_id'] = gameId;
    data['json'] = jsonData;
    data['random_card'] = randomCard;
    data['token'] = token;
    data['block'] = block;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
