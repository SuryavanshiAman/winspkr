class PlinkoBetHistory {
  dynamic id;
  dynamic userid;
  dynamic amount;
  dynamic type;
  dynamic multipler;
  dynamic win_amount;
  dynamic status;
  dynamic datetime;
  dynamic tax;
  dynamic after_tax;
  dynamic orderid;


  PlinkoBetHistory({
    required this.id,
    required this.userid,
    required this.amount,
    required this.type,
    required this.multipler,
    required this.win_amount,
    required this.status,
    required this.datetime,
    required this.tax,
    required this.after_tax,
    required this.orderid,

  });
  factory PlinkoBetHistory.fromJson(Map<String, dynamic> json) {
    return PlinkoBetHistory(
      id: json['id'],
      userid: json['userid'],
      amount: json['amount'],
      type: json['type'],
      multipler: json['multipler'],
      win_amount: json['win_amount'],
      status: json['status'],
      datetime: json['created_at'],
      tax: json['tax'],
      after_tax: json['after_tax'],
      orderid: json['orderid'],

    );
  }
}