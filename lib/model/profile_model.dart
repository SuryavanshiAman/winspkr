class ProfileModel {
  int? success;
  String? message;
  Data? data;
  String? aviatorLink;
  String? aviatorEventName;
  String? appDownloadLink;
  String? regRefLink;
  dynamic usdtPayinAmount;
  dynamic usdtPayoutAmount;

  ProfileModel(
      {this.success,
      this.message,
      this.data,
      this.aviatorLink,
      this.aviatorEventName,
        this.appDownloadLink,
        this.regRefLink,
        this.usdtPayinAmount,
        this.usdtPayoutAmount
      });

  ProfileModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    aviatorLink = json['aviator_link'];
    aviatorEventName = json['aviator_event_name'];
    appDownloadLink = json['apk_link'];
    regRefLink = json['referral_code_url'];
    usdtPayinAmount = json['usdt_payin_amount'];
    usdtPayoutAmount = json['usdt_payout_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['aviator_link'] = aviatorLink;
    data['aviator_event_name'] = aviatorEventName;
    data['apk_link'] = appDownloadLink;
    data['referral_code_url'] = regRefLink;
    data['usdt_payin_amount'] = usdtPayinAmount;
    data['usdt_payout_amount'] = usdtPayoutAmount;
    return data;
  }
}

class Data {
  int? id;
  String? name;
  dynamic uId;
  String? mobile;
  dynamic email;
  dynamic emailVerifiedAt;
  String? password;
  String? image;
  String? referralCode;
  dynamic referrerId;
  dynamic thirdPartyWallet;
  dynamic commission;
  dynamic bonus;
  dynamic totalReferralBonus;
  dynamic turnover;
  dynamic todayTurnover;
  dynamic totalBet;
  dynamic firstRecharge;
  dynamic salaryFirstRecharge;
  dynamic firstRechargeAmount;
  dynamic recharge;
  dynamic verification;
  dynamic roleId;
  dynamic dob;
  dynamic wallet;
  dynamic bonusWallet;
  dynamic totalPayIn;
  dynamic totalPayout;
  dynamic noOfPayIn;
  dynamic noOfPayout;
  dynamic yesterdayPayIn;
  dynamic yesterdayRegister;
  dynamic yesterdayNoOfPayIn;
  dynamic yesterdayFirstDeposit;
  dynamic yesterdayTotalCommission;
  dynamic winningWallet;
  dynamic depositAmount;
  dynamic withdrawBalance;
  dynamic winLoss;
  dynamic type;
  dynamic status;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.name,
      this.uId,
      this.mobile,
      this.email,
      this.emailVerifiedAt,
      this.password,
      this.image,
      this.referralCode,
      this.referrerId,
      this.thirdPartyWallet,
      this.commission,
      this.bonus,
      this.totalReferralBonus,
      this.turnover,
      this.todayTurnover,
      this.totalBet,
      this.firstRecharge,
      this.salaryFirstRecharge,
      this.firstRechargeAmount,
      this.recharge,
      this.verification,
      this.roleId,
      this.dob,
      this.wallet,
      this.bonusWallet,
      this.totalPayIn,
      this.totalPayout,
      this.noOfPayIn,
      this.noOfPayout,
      this.yesterdayPayIn,
      this.yesterdayRegister,
      this.yesterdayNoOfPayIn,
      this.yesterdayFirstDeposit,
      this.yesterdayTotalCommission,
      this.winningWallet,
      this.depositAmount,
      this.withdrawBalance,
      this.winLoss,
      this.type,
      this.status,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    uId = json['u_id'];
    mobile = json['mobile'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    password = json['password'];
    image = json['image'];
    referralCode = json['referral_code'];
    referrerId = json['referrer_id'];
    thirdPartyWallet = json['third_party_wallet'];
    commission = json['commission'];
    bonus = json['bonus'];
    totalReferralBonus = json['total_referral_bonus'];
    turnover = json['turnover'];
    todayTurnover = json['today_turnover'];
    totalBet = json['totalbet'];
    firstRecharge = json['first_recharge'];
    salaryFirstRecharge = json['salary_first_recharge'];
    firstRechargeAmount = json['first_recharge_amount'];
    recharge = json['recharge'];
    verification = json['verification'];
    roleId = json['role_id'];
    dob = json['dob'];
    wallet = json['wallet'];
    bonusWallet = json['bonus_wallet'];
    totalPayIn = json['total_payin'];
    totalPayout = json['total_payout'];
    noOfPayIn = json['no_of_payin'];
    noOfPayout = json['no_of_payout'];
    yesterdayPayIn = json['yesterday_payin'];
    yesterdayRegister = json['yesterday_register'];
    yesterdayNoOfPayIn = json['yesterday_no_of_payin'];
    yesterdayFirstDeposit = json['yesterday_first_deposit'];
    yesterdayTotalCommission = json['yesterday_total_commission'];
    winningWallet = json['winning_wallet'];
    depositAmount = json['deposit_amount'];
    withdrawBalance = json['withdraw_balance'];
    winLoss = json['win_loss'];
    type = json['type'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['u_id'] = uId;
    data['mobile'] = mobile;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['password'] = password;
    data['image'] = image;
    data['referral_code'] = referralCode;
    data['referrer_id'] = referrerId;
    data['third_party_wallet'] = thirdPartyWallet;
    data['commission'] = commission;
    data['bonus'] = bonus;
    data['total_referral_bonus'] = totalReferralBonus;
    data['turnover'] = turnover;
    data['today_turnover'] = todayTurnover;
    data['totalbet'] = totalBet;
    data['first_recharge'] = firstRecharge;
    data['salary_first_recharge'] = salaryFirstRecharge;
    data['first_recharge_amount'] = firstRechargeAmount;
    data['recharge'] = recharge;
    data['verification'] = verification;
    data['role_id'] = roleId;
    data['dob'] = dob;
    data['wallet'] = wallet;
    data['bonus_wallet'] = bonusWallet;
    data['total_payin'] = totalPayIn;
    data['total_payout'] = totalPayout;
    data['no_of_payin'] = noOfPayIn;
    data['no_of_payout'] = noOfPayout;
    data['yesterday_payin'] = yesterdayPayIn;
    data['yesterday_register'] = yesterdayRegister;
    data['yesterday_no_of_payin'] = yesterdayNoOfPayIn;
    data['yesterday_first_deposit'] = yesterdayFirstDeposit;
    data['yesterday_total_commission'] = yesterdayTotalCommission;
    data['winning_wallet'] = winningWallet;
    data['deposit_amount'] = depositAmount;
    data['withdraw_balance'] = withdrawBalance;
    data['win_loss'] = winLoss;
    data['type'] = type;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
