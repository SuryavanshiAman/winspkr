import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wins_pkr/utils/routes/routers_name.dart';
import 'package:wins_pkr/view_modal/user_view_modal.dart';
import 'package:provider/provider.dart';
import 'package:wins_pkr/constants/app_colors.dart';
import 'package:wins_pkr/constants/text_widget.dart';
import 'package:wins_pkr/generated/assets.dart';
import 'package:wins_pkr/main.dart';
import 'package:wins_pkr/view/home/controller/home_controller.dart';

class CasinoPage extends StatefulWidget {
  const CasinoPage({super.key});

  @override
  State<CasinoPage> createState() => _CasinoPageState();
}

class _CasinoPageState extends State<CasinoPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(builder: (context, hoc, child) {
      return Column(
        children: [
          SizedBox(
            height: height * 0.01,
          ),
          Container(
            padding: EdgeInsets.all(height * 0.01),
            height: height * 0.055,
            width: width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.imagesHomestrip),
                fit: BoxFit.fill,
              ),
            ),
            child: const TextWidget(
              textAlign: TextAlign.left,
              title: 'Casino Games',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.whiteColor,
            ),
          ),
          SizedBox(
            height: height * 0.2,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const ScrollPhysics(),
              itemCount: hoc.casinoList.length,
              itemBuilder: (context, index) {
                return
                  InkWell(
                    onTap: () async {
                      UserViewModel userViewModal = UserViewModel();
                      String? userId = await userViewModal.getUser();
                      if (userId != null) {
                        Navigator.pushNamed(context, hoc.casinoList[index].route!);
                      } else {
                        if (kDebugMode) {
                          print('User Not login!');
                        }
                        Navigator.pushNamed(context, RoutesName.login);
                      }
                    },
                    child: Center(
                      child: Container(
                        width: width * 0.42,
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage(hoc.casinoList[index].img),
                                fit: BoxFit.fill)),
                      ),
                    ),
                  );

                //   InkWell(
                //   onTap: () {},
                //   child: Container(
                //     margin: const EdgeInsets.all(8),
                //     width: width * 0.65,
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(10),
                //       image: DecorationImage(
                //           image: AssetImage(hoc.casinoList[index]),
                //           fit: BoxFit.fill),
                //     ),
                //   ),
                // );
              },
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: width*0.04,vertical: height*0.02),
height: height*0.25,
              width: width,
              child: Image.asset(Assets.imagesCommingSoonImg,fit: BoxFit.fill,))
        ],
      );
    });
  }
}
