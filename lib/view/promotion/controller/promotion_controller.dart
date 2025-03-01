
import 'package:flutter/material.dart';
import 'package:wins_pkr/generated/assets.dart';
import 'package:wins_pkr/utils/routes/routers_name.dart';

class PromotionController with ChangeNotifier{

  int _tabIndex = 0;
  int get tabIndex => _tabIndex;
  void setTabIndex(int index) {
    _tabIndex = index;
    notifyListeners();
  }

  List<BtnModel> listItems = [
    BtnModel(icon: Icons.info, title: 'PROMO'),
    BtnModel(icon: Icons.history, title: 'VIP'),
  ];

  List<PromoItemModel> promoItemList = [
    PromoItemModel(img: Assets.iconsCopyCode, title: 'Copy Invitation Code'),
    PromoItemModel(img: Assets.iconsTeamPort, title: 'Subordinate data', route: RoutesName.subordinateDate),
    PromoItemModel(img: Assets.iconsInvite, title: 'Invitation rules', route: RoutesName.invitationRules),
  ];
}
class BtnModel{
  final IconData icon;
  final String title;
  BtnModel({required this.icon, required this.title});
}
class PromoItemModel{
  final String img;
  final String title;
  final String? route;
  PromoItemModel({required this.img, required this.title, this.route});
}