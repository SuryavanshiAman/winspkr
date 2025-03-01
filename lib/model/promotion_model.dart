class PromotionDataModel {
  int? status;
  String? message;
  Data? data;

  PromotionDataModel({this.status, this.message, this.data});

  PromotionDataModel.fromJson(Map<String, dynamic> json) {
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
  int? yesterdayTotalCommission;
  int? register;
  int? depositNumber;
  int? depositAmount;
  int? firstDeposit;
  int? subordinatesRegister;
  int? subordinatesDepositNumber;
  int? subordinatesDepositAmount;
  int? subordinatesFirstDeposit;
  int? directSubordinate;
  int? totalCommission;
  int? teamSubordinate;
  String? referralCode;

  Data(
      {this.yesterdayTotalCommission,
        this.register,
        this.depositNumber,
        this.depositAmount,
        this.firstDeposit,
        this.subordinatesRegister,
        this.subordinatesDepositNumber,
        this.subordinatesDepositAmount,
        this.subordinatesFirstDeposit,
        this.directSubordinate,
        this.totalCommission,
        this.teamSubordinate,
        this.referralCode});

  Data.fromJson(Map<String, dynamic> json) {
    yesterdayTotalCommission = json['yesterday_total_commission'];
    register = json['register'];
    depositNumber = json['deposit_number'];
    depositAmount = json['deposit_amount'];
    firstDeposit = json['first_deposit'];
    subordinatesRegister = json['subordinates_register'];
    subordinatesDepositNumber = json['subordinates_deposit_number'];
    subordinatesDepositAmount = json['subordinates_deposit_amount'];
    subordinatesFirstDeposit = json['subordinates_first_deposit'];
    directSubordinate = json['direct_subordinate'];
    totalCommission = json['total_commission'];
    teamSubordinate = json['team_subordinate'];
    referralCode = json['referral_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['yesterday_total_commission'] = yesterdayTotalCommission;
    data['register'] = register;
    data['deposit_number'] = depositNumber;
    data['deposit_amount'] = depositAmount;
    data['first_deposit'] = firstDeposit;
    data['subordinates_register'] = subordinatesRegister;
    data['subordinates_deposit_number'] = subordinatesDepositNumber;
    data['subordinates_deposit_amount'] = subordinatesDepositAmount;
    data['subordinates_first_deposit'] = subordinatesFirstDeposit;
    data['direct_subordinate'] = directSubordinate;
    data['total_commission'] = totalCommission;
    data['team_subordinate'] = teamSubordinate;
    data['referral_code'] = referralCode;
    return data;
  }
}
