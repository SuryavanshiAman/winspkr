class BetHistoryCon {
  dynamic id;
  dynamic amount;
  dynamic winAmount;
  dynamic number;
  dynamic winNumber;
  dynamic gameNo;
  dynamic gameId;
  dynamic userid;
  dynamic status;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic gameName;
  dynamic commission;
  dynamic tradeAmount;

  BetHistoryCon({
    this.id,
    this.amount,
    this.winAmount,
    this.number,
    this.winNumber,
    this.gameNo,
    this.gameId,
    this.userid,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.gameName,
    this.commission,
    this.tradeAmount,
  });

  factory BetHistoryCon.fromJson(Map<String, dynamic> json) {
    return BetHistoryCon(
      id: json['id'],
      amount: json['amount'],
      winAmount: json['win_amount'],
      number: json['number'],
      winNumber: json['win_number'],
      gameNo: json['game_no'],
      gameId: json['game_id'],
      userid: json['userid'],
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      gameName: json['game_name'],
      commission: json['commission'],
      tradeAmount: json['trade_amount'],
    );
  }
}