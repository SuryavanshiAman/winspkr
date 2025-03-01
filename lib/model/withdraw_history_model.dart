class WithdrawHistoryModel {
  String? message;
  int? status;
  List<Data>? data;

  WithdrawHistoryModel({this.message, this.status, this.data});

  WithdrawHistoryModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
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
    data['message'] = message;
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? userId;
  String? amount;
  int? actualAmount;
  String? mobile;
  int? accountId;
  int? type;
  String? usdtWalletAddress;
  String? orderId;
  String? payout;
  String? remark;
  String? response;
  int? status;
  String? typeimage;
  String? referenceId;
  String? rejectMsg;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.userId,
        this.amount,
        this.actualAmount,
        this.mobile,
        this.accountId,
        this.type,
        this.usdtWalletAddress,
        this.orderId,
        this.payout,
        this.remark,
        this.response,
        this.status,
        this.typeimage,
        this.referenceId,
        this.rejectMsg,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    amount = json['amount'];
    actualAmount = json['actual_amount'];
    mobile = json['mobile'];
    accountId = json['account_id'];
    type = json['type'];
    usdtWalletAddress = json['usdt_wallet_address'];
    orderId = json['order_id'];
    payout = json['payout'];
    remark = json['remark'];
    response = json['response'];
    status = json['status'];
    typeimage = json['typeimage'];
    referenceId = json['referenceId'];
    rejectMsg = json['reject_msg'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['amount'] = amount;
    data['actual_amount'] = actualAmount;
    data['mobile'] = mobile;
    data['account_id'] = accountId;
    data['type'] = type;
    data['usdt_wallet_address'] = usdtWalletAddress;
    data['order_id'] = orderId;
    data['payout'] = payout;
    data['remark'] = remark;
    data['response'] = response;
    data['status'] = status;
    data['typeimage'] = typeimage;
    data['referenceId'] = referenceId;
    data['reject_msg'] = rejectMsg;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
