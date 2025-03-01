class ResultGameHistory {
  final dynamic number;
  final dynamic gamesno;
  final dynamic gameId;
  final dynamic time;
  final dynamic hash;
  final dynamic block;

  ResultGameHistory({
    required this.number,
    required this.gamesno,
    required this.gameId,
    required this.time,
    required this.hash,
    required this.block,
  });

  factory ResultGameHistory.fromJson(Map<dynamic, dynamic> json) {
    return ResultGameHistory(
      number: json['number'],
      gamesno: json['gamesno'],
      gameId: json['game_id'],
      time: json['created_at'],
      hash: json['token'],
      block: json['block'],
    );
  }

}