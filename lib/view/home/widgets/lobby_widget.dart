import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wins_pkr/constants/app_colors.dart';
import 'package:wins_pkr/constants/text_widget.dart';
import 'package:wins_pkr/generated/assets.dart';
import 'package:wins_pkr/main.dart';
import 'package:wins_pkr/utils/routes/routers_name.dart';
import 'package:wins_pkr/view/home/controller/home_controller.dart';
import 'package:wins_pkr/view_modal/user_view_modal.dart';

class LobbyScreen extends StatefulWidget {
  const LobbyScreen({super.key});

  @override
  State<LobbyScreen> createState() => _LobbyScreenState();
}

class _LobbyScreenState extends State<LobbyScreen> {
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
                // colorFilter: ColorFilter.mode(
                //   Colors.deepOrange, // Apply a gray color filter
                //   BlendMode.difference, // Blend mode to desaturate
                // ),
                image: AssetImage(Assets.imagesHomestrip),
                fit: BoxFit.fill,
              ),
            ),
            child: const TextWidget(
              textAlign: TextAlign.left,
              title: 'Hot Games',
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: AppColors.whiteColor,
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          SizedBox(
            height: height * 0.2,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const ScrollPhysics(),
              itemCount: hoc.hotList.length,
              itemBuilder: (BuildContext context, index) {
                return InkWell(
                  onTap: () async {
                    UserViewModel userViewModal = UserViewModel();
                    String? userId = await userViewModal.getUser();
                    if (userId != null) {
                      Navigator.pushNamed(context, hoc.hotList[index].route!);
                    } else {
                      if (kDebugMode) {
                        print('User Not login!');
                      }
                      Navigator.pushNamed(context, RoutesName.login);
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    width: width * 0.32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage(hoc.hotList[index].img),
                          fit: BoxFit.fill),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Container(
            padding: EdgeInsets.all(height * 0.01),
            height: height * 0.055,
            width: width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                // colorFilter: ColorFilter.mode(
                //   Colors.deepOrange, // Apply a gray color filter
                //   BlendMode.difference, // Blend mode to desaturate
                // ),
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
              title: 'Sports Games',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.whiteColor,
            ),
          ),
          SizedBox(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: hoc.sportsList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    height: height * 0.15,
                    width: width * 0.6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage(hoc.sportsList[index]),
                          fit: BoxFit.contain),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      );
    });
  }
}
