class MyBetModel {
  final int? id;
  final int? uid;
  final double? amount;
  final double? stopMultiplier;
  final int? gameId;
  final double? totalAmount;
  final int? number;
  final int? subNumber;
  final String? color;
  final String? gameSrNum;
  final double? commission;
  final int? status;
  final int? resultStatus;
  final double? win;
  final double? multiplier;
  final String ?datetime;
  final String ?createdAt;
  final String ?updatedAt;
  final double ?cashoutAmount;

  MyBetModel({
     this.id,
     this.uid,
     this.amount,
     this.stopMultiplier,
     this.gameId,
     this.totalAmount,
     this.number,
    this.subNumber,
    this.color,
     this.gameSrNum,
     this.commission,
     this.status,
     this.resultStatus,
     this.win,
     this.multiplier,
     this.datetime,
     this.createdAt,
     this.updatedAt,
     this.cashoutAmount,
  });

  factory MyBetModel.fromJson(Map<String, dynamic> json) {
    return MyBetModel(
      id: json['id'],
      uid: json['uid'],
      amount: json['amount'].toDouble(),
      stopMultiplier: json['stop_multiplier'].toDouble(),
      gameId: json['game_id'],
      totalAmount: json['totalamount'].toDouble(),
      number: json['number'],
      subNumber: json['sub_number'],
      color: json['color'],
      gameSrNum: json['game_sr_num'],
      commission: json['commission'].toDouble(),
      status: json['status'],
      resultStatus: json['result_status'],
      win: json['win'].toDouble(),
      multiplier: json['multiplier'].toDouble(),
      datetime: json['datetime'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      cashoutAmount: json['cashout_amount'].toDouble(),
    );
  }
}

