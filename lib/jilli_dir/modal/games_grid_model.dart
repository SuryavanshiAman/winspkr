
class JilliGamesGridModel {
  dynamic name;
  dynamic id;
  dynamic img;

  JilliGamesGridModel({this.name, this.id, this.img});

  JilliGamesGridModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    img = json['img'];
  }

}
