class BetList {
  final String name;
  final int amount;
  final double cashOut;
  BetList({required this.name, required this.amount, required this.cashOut});
}


class Demo {
  String name;
  double amount;
  String x;
  String winners;
  int color;
  Demo(
      {required this.name,
        required this.amount,
        required this.x,
        required this.winners,
        required this.color});
}



class AllBets {
  String? image;
  String? username;
  String? bet;
  String? win;
  AllBets(this.image, this.username, this.bet, this.win);
}
