import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wins_pkr/constants/constant_widgets/app_bar.dart';
import 'package:wins_pkr/generated/assets.dart';
import 'package:wins_pkr/main.dart';
import 'package:wins_pkr/view/promotion/controller/promotion_controller.dart';
import 'package:wins_pkr/view/promotion/widget/promotion_widget.dart';
import 'package:wins_pkr/view_modal/promotion_view_model.dart';
import 'package:wins_pkr/view_modal/user_view_modal.dart';

class PromotionTab extends StatefulWidget {
  const PromotionTab({super.key});

  @override
  State<PromotionTab> createState() => _PromotionTabState();
}

class _PromotionTabState extends State<PromotionTab> {
  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
    UserViewModel userViewModal = UserViewModel();
    String? userId = await userViewModal.getUser();
    if (userId != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final promotionScreen =
        Provider.of<PromotionViewModel>(context, listen: false);
        promotionScreen.promotionApi(context);
      });
    } else {
      if (kDebugMode) {
        print('User Not login!');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PromotionController>(builder: (context, prc, child) {
      return Scaffold(
        appBar: const AppBarPage(),
        body: Container(
          height: height,
          width: width,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.imagesAppBg), fit: BoxFit.fill),
          ),
          child: ListView(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            children: [

             const PromotionWidget()
          // else const TestWidget()
            ],
          ),
        ),
      );
    });
  }
}
