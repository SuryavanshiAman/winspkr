import 'package:flutter/cupertino.dart';
import 'package:wins_pkr/generated/assets.dart';

import '../../../utils/routes/routers_name.dart';

class HomeController with ChangeNotifier {
  int _tabIndex = 0;
  int get tabIndex => _tabIndex;
  void setTabIndex(int index) {
    _tabIndex = index;
    notifyListeners();
  }

  List<Category> categoryList = [
    Category(img: Assets.iconsHot, title: 'Hot'),
    Category(img: Assets.iconsLobby, title: 'Popular'),
    Category(img: Assets.iconsCasino, title: 'Casino'),
    Category(img: Assets.iconsSports, title: 'Sports'),
  ];
  List<LobbyModel> hotList = [
    LobbyModel(img: Assets.categoryColorPri, route: RoutesName.winGoHome),
    LobbyModel(img: Assets.categoryTrxCol, route: RoutesName.trx),
    LobbyModel(img: Assets.categoryAviator, route: RoutesName.aviator),
    LobbyModel(img: Assets.imagesAndarbahar, route: RoutesName.andarBahar),
    LobbyModel(img: Assets.imagesDragontiger, route: RoutesName.dragonTiger),
    LobbyModel(img: Assets.categoryPlinko, route: RoutesName.plinko),
    LobbyModel(img: Assets.categoryMines, route: RoutesName.mines),
  ];

  List<CasinoModel> casinoList = [
    CasinoModel(img: Assets.imagesAndarbahar, route: RoutesName.andarBahar),
    CasinoModel(img: Assets.imagesDragontiger, route: RoutesName.dragonTiger),
  ];

  // List<String> casinoList = [
  //   Assets.imagesCasino2,
  //   Assets.imagesCasino
  // ];

  List<String> sportsList = [
    Assets.imagesCommingSoonImg,
  ];
}

class LobbyModel {
  final String img;
  final String? route;

  LobbyModel({required this.img, this.route});
}

class CasinoModel {
  final String img;
  final String? route;

  CasinoModel({required this.img, this.route});
}

class Category {
  final String img;
  final String title;

  Category({required this.img, required this.title});
}
