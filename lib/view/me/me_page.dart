import 'package:flutter/material.dart';
import 'package:wins_pkr/view/deposit/widgets/deposit.dart';
import 'package:wins_pkr/view/deposit/widgets/withdraw.dart';
import 'package:wins_pkr/view/vip/vip_page.dart';
import 'package:provider/provider.dart';
import 'package:wins_pkr/constants/app_button.dart';
import 'package:wins_pkr/constants/app_colors.dart';
import 'package:wins_pkr/constants/constant_widgets/app_bar.dart';
import 'package:wins_pkr/constants/text_widget.dart';
import 'package:wins_pkr/generated/assets.dart';
import 'package:wins_pkr/main.dart';
import 'package:wins_pkr/utils/routes/routers_name.dart';
import 'package:wins_pkr/view/auth/logout_page.dart';
import 'package:wins_pkr/view/me/controller/me_controller.dart';
import 'package:wins_pkr/view_modal/user_view_modal.dart';

class MeScreen extends StatefulWidget {
  const MeScreen({super.key});

  @override
  State<MeScreen> createState() => _MeScreenState();
}

class _MeScreenState extends State<MeScreen> {
  @override
  Widget build(BuildContext context) {
    List<FirstModel> firstModelList = [
      FirstModel(
          image: Assets.iconsWithdrawal,
          title: 'Withdrawal',
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>const Withdraw()));
          }),
      FirstModel(
          image: Assets.iconsDepositIcon,
          title: 'Deposit',
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const Deposit()));
          }),
      FirstModel(
          image: Assets.vipVipSe,
          title: 'VIP',
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const TestWidget()));
          },
          scale: 1.6),
    ];
    return Scaffold(
      appBar: const AppBarPage(),
      body: Consumer<MeController>(builder: (context, mec, child) {
        return Container(
          height: height,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.imagesAppBg), fit: BoxFit.fill),
          ),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: height * 0.02),
                  padding: EdgeInsets.only(top: height * 0.03),
                  decoration: const BoxDecoration(
                    // gradient: AppColors.appBarGradient,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: List.generate(firstModelList.length, (index) {
                          return InkWell(
                            onTap: firstModelList[index].onTap,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  scale: firstModelList[index].scale ?? 1.2,
                                  firstModelList[index].image,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(height: 5),
                                TextWidget(
                                  title: firstModelList[index].title,
                                  fontSize: 15,
                                  fontFamily: "open_sans_reg",
                                  color: AppColors.whiteColor,
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                      SizedBox(height: height * 0.03),
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                            // gradient: AppColors.boxGradient,
                            image: DecorationImage(image: AssetImage(Assets.imagesAppBg),fit: BoxFit.fill),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                topLeft: Radius.circular(30)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: height * 0.03,
                                      left: width * 0.1,
                                      bottom: height * 0.03),
                                  child: const TextWidget(
                                    title: 'OTHER SERVICES',
                                    fontFamily: "open_sans_reg",
                                    fontSize: 20,
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                              ),
                              GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10,
                                        childAspectRatio: 1.6),
                                itemCount: mec.otherServicesList.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () async {
                                      UserViewModel userViewModal =
                                          UserViewModel();
                                      String? userId =
                                          await userViewModal.getUser();
                                      if (userId != null) {
                                        Navigator.pushNamed(context,
                                            mec.otherServicesList[index].route);
                                      } else {
                                        Navigator.pushNamed(
                                            context, RoutesName.login);
                                      }
                                    },
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [

                                        Image.asset(
                                          height: height * 0.028,
                                          mec.otherServicesList[index].image,
                                          fit: BoxFit.contain,
                                          color: AppColors.whiteColor,
                                        ),
                                        const SizedBox(height: 5),
                                        TextWidget(
                                          title: mec
                                              .otherServicesList[index].title,
                                          fontSize: 15,
                                          fontFamily: "open_sans_reg",
                                          color: AppColors.whiteColor,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: width * 0.05, right: width * 0.05),
                                height: height * 0.18,
                                width: width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  image: const DecorationImage(
                                    image:
                                        AssetImage(Assets.imagesAccountBanner),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              AppBtn(
                                color: Colors.transparent,
                                height: height * 0.05,
                                width: width * 0.9,
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return const Dialog(
                                          child: LogoutScreen());
                                    },
                                  );
                                },
                                title: "LOG OUT",
                                border: Border.all(color: AppColors.whiteColor),
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                titleColor: AppColors.whiteColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class FirstModel {
  final String image;
  final String title;
  final VoidCallback? onTap;
  final double? scale;

  FirstModel(
      {required this.image, required this.title, this.onTap, this.scale});
}
