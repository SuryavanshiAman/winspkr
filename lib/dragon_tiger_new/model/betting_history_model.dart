


class BettingHistoryModel {
  dynamic id;
  dynamic amount;
  dynamic commission;
  dynamic tradeAmount;
  dynamic winAmount;
  dynamic number;
  dynamic winNumber;
  dynamic gamesNo;
  dynamic gameId;
  dynamic userid;
  dynamic orderId;
  dynamic status;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic gameName;
  dynamic virtualGameName;

  BettingHistoryModel(
      {this.id,
        this.amount,
        this.commission,
        this.tradeAmount,
        this.winAmount,
        this.number,
        this.winNumber,
        this.gamesNo,
        this.gameId,
        this.userid,
        this.orderId,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.gameName,
        this.virtualGameName});

  BettingHistoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amount = json['amount'];
    commission = json['commission'];
    tradeAmount = json['trade_amount'];
    winAmount = json['win_amount'];
    number = json['number'];
    winNumber = json['win_number'];
    gamesNo = json['games_no'];
    gameId = json['game_id'];
    userid = json['userid'];
    orderId = json['order_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    gameName = json['game_name'];
    virtualGameName = json['virtual_game_name'];
  }

}