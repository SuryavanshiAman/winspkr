import 'package:flutter/cupertino.dart';
import 'package:wins_pkr/generated/assets.dart';
import 'package:wins_pkr/utils/routes/routers_name.dart';

class MeController with ChangeNotifier {
  List<OtherServicesModel> otherServicesList = [
    OtherServicesModel(
      image: Assets.imagesPersonalCenter,
      title: 'Personal\nCenter',
      route: RoutesName.personalCenter,
    ),
    OtherServicesModel(
      image: Assets.imagesDiscount,
      title: 'Customer\nService',
      route: RoutesName.customerService,
    ),
    OtherServicesModel(
      image: Assets.imagesRecord,
      title: 'Record',
      route: RoutesName.record,
    ),
    OtherServicesModel(
      image: Assets.imagesOrder,
      title: 'Order',
      route: RoutesName.order,
    ),
    OtherServicesModel(
        image: Assets.imagesBank, title: 'Bank/Easypaisa/jazzcash', route: RoutesName.addBank),
    OtherServicesModel(
      image: Assets.imagesMessage,
      title: 'Message',
      route: RoutesName.message,
    ),
  ];
}

class OtherServicesModel {
  final String image;
  final String title;
  final String route;

  OtherServicesModel({required this.image, required this.route, required this.title});
}
