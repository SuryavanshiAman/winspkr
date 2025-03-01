

class ResultHistoryModel {


  dynamic price;

  ResultHistoryModel({this.price});

  ResultHistoryModel.fromJson(Map<String, dynamic> json) {
  price = json['price'];
  }
}

