class VipShowListModel {
  String? message;
  int? status;
  int? daysCount;
  int? myExperience;
  List<Data>? data;

  VipShowListModel(
      {this.message, this.status, this.daysCount, this.myExperience, this.data});

  VipShowListModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    daysCount = json['days_count'];
    myExperience = json['my_experience'];
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
    data['days_count'] = daysCount;
    data['my_experience'] = myExperience;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  dynamic rangeAmount;
  dynamic levelUpRewards;
  dynamic monthlyRewards;
  dynamic rebateRate;
  int? status;
  dynamic levelUpStatus;
  dynamic monthlyRewardsStatus;
  dynamic rebateRateStatus;
  dynamic betAmount;
  dynamic percentage;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.name,
        this.rangeAmount,
        this.levelUpRewards,
        this.monthlyRewards,
        this.rebateRate,
        this.status,
        this.levelUpStatus,
        this.monthlyRewardsStatus,
        this.rebateRateStatus,
        this.betAmount,
        this.percentage,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    rangeAmount = json['range_amount'];
    levelUpRewards = json['level_up_rewards'];
    monthlyRewards = json['monthly_rewards'];
    rebateRate = json['rebate_rate'];
    status = json['status'];
    levelUpStatus = json['level_up_status'];
    monthlyRewardsStatus = json['monthly_rewards_status'];
    rebateRateStatus = json['rebate_rate_status'];
    betAmount = json['bet_amount'];
    percentage = json['percentage'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['range_amount'] = rangeAmount;
    data['level_up_rewards'] = levelUpRewards;
    data['monthly_rewards'] = monthlyRewards;
    data['rebate_rate'] = rebateRate;
    data['status'] = status;
    data['level_up_status'] = levelUpStatus;
    data['monthly_rewards_status'] = monthlyRewardsStatus;
    data['rebate_rate_status'] = rebateRateStatus;
    data['bet_amount'] = betAmount;
    data['percentage'] = percentage;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
