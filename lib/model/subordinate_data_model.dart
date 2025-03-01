class SubordinateDataModel {
  int? status;
  String? message;
  Data? data;

  SubordinateDataModel({this.status, this.message, this.data});

  SubordinateDataModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? numberOfDeposit;
  int? payInAmount;
  int? numberOfBettor;
  int? betAmount;
  int? firstDeposit;
  int? firstDepositAmount;
  List<SubordinatesData>? subordinatesData;

  Data(
      {this.numberOfDeposit,
        this.payInAmount,
        this.numberOfBettor,
        this.betAmount,
        this.firstDeposit,
        this.firstDepositAmount,
        this.subordinatesData});

  Data.fromJson(Map<String, dynamic> json) {
    numberOfDeposit = json['number_of_deposit'];
    payInAmount = json['payin_amount'];
    numberOfBettor = json['number_of_bettor'];
    betAmount = json['bet_amount'];
    firstDeposit = json['first_deposit'];
    firstDepositAmount = json['first_deposit_amount'];
    if (json['subordinates_data'] != null) {
      subordinatesData = <SubordinatesData>[];
      json['subordinates_data'].forEach((v) {
        subordinatesData!.add(SubordinatesData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['number_of_deposit'] = numberOfDeposit;
    data['payin_amount'] = payInAmount;
    data['number_of_bettor'] = numberOfBettor;
    data['bet_amount'] = betAmount;
    data['first_deposit'] = firstDeposit;
    data['first_deposit_amount'] = firstDepositAmount;
    if (subordinatesData != null) {
      data['subordinates_data'] =
          subordinatesData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubordinatesData {
  int? id;
  String? uId;
  int? betAmount;
  int? payInAmount;
  int? commission;

  SubordinatesData(
      {this.id, this.uId, this.betAmount, this.payInAmount, this.commission});

  SubordinatesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uId = json['u_id'];
    betAmount = json['bet_amount'];
    payInAmount = json['payin_amount'];
    commission = json['commission'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['u_id'] = uId;
    data['bet_amount'] = betAmount;
    data['payin_amount'] = payInAmount;
    data['commission'] = commission;
    return data;
  }
}
