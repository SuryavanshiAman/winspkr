import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wins_pkr/constants/app_colors.dart';
import 'package:wins_pkr/constants/constant_widgets/app_bar.dart';
import 'package:wins_pkr/view/home/widgets/slider_widget.dart';
import 'package:wins_pkr/constants/text_widget.dart';
import 'package:wins_pkr/generated/assets.dart';
import 'package:wins_pkr/main.dart';
import 'package:wins_pkr/view/home/controller/home_controller.dart';
import 'package:wins_pkr/view/home/widgets/hot_widget.dart';
import 'package:wins_pkr/view/home/widgets/casino_widget.dart';
import 'package:wins_pkr/view/home/widgets/lobby_widget.dart';
import 'package:wins_pkr/view/home/widgets/sports_widget.dart';
import 'package:provider/provider.dart';
import 'package:wins_pkr/view_modal/profile_view_model.dart';
import 'package:wins_pkr/view_modal/user_view_modal.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
    UserViewModel userViewModal = UserViewModel();
    String? userId = await userViewModal.getUser();
    if (userId != null) {
      final userPro = Provider.of<ProfileViewModel>(context, listen: false);
      userPro.userProfileApi(context);
    } else {
      if (kDebugMode) {
        print('User Not login!');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(builder: (context, lbc, child) {
      return Scaffold(
        appBar: const AppBarPage(),
        body: Container(
          height: height,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.imagesAppBg), fit: BoxFit.fill),
           ),
          child: ListView(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            children: [
              const SliderWidget(),
              Container(
                margin: const EdgeInsets.all(10),
                height: height * 0.055,
                decoration: BoxDecoration(
                  gradient: AppColors.appBarGradient,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.volume_up,
                      size: 20,
                      color: AppColors.whiteColor,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    TextWidget(
                      title:
                          'Stay close to anything that makes you glad you are alive.!!!',
                      fontSize: 11,
                      color: AppColors.whiteColor,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.09,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: lbc.categoryList.length,
                  itemBuilder: (context, i) {
                    return InkWell(
                      onTap: () {
                        lbc.setTabIndex(i);
                      },
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.all(5),
                        width: width * 0.28,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: lbc.tabIndex == i
                              ? AppColors.buttonGradient4
                              : AppColors.boxGradient,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              lbc.categoryList[i].img,
                              height: height * 0.03,
                            ),
                            TextWidget(
                              title: lbc.categoryList[i].title,
                              fontWeight: FontWeight.bold,
                              color: AppColors.whiteColor,
                              fontSize: 14,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              if (lbc.tabIndex == 0)
                const HotScreen()
              else if (lbc.tabIndex == 1)
                const  LobbyScreen()
              else if (lbc.tabIndex == 2)
                const CasinoPage()
              else
                const SportsScreen()
            ],
          ),
        ),
      );
    });
  }
}
