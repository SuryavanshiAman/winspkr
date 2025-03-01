import 'package:flutter/material.dart';

import 'package:share_plus/share_plus.dart';
import 'package:wins_pkr/constants/app_button.dart';
import 'package:wins_pkr/constants/app_colors.dart';
import 'package:wins_pkr/constants/text_widget.dart';
import 'package:wins_pkr/generated/assets.dart';
import 'package:wins_pkr/main.dart';
import 'package:wins_pkr/res/launcher.dart';
import 'package:wins_pkr/utils/routes/routers_name.dart';
import 'package:wins_pkr/utils/utils.dart';
import 'package:wins_pkr/view/promotion/controller/promotion_controller.dart';
import 'package:wins_pkr/view_modal/profile_view_model.dart';
import 'package:wins_pkr/view_modal/promotion_view_model.dart';
import 'package:provider/provider.dart';
import 'package:wins_pkr/view_modal/user_view_modal.dart';

class PromotionWidget extends StatelessWidget {
  const PromotionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final promotionViewModel = Provider.of<PromotionViewModel>(context);
    final profileViewModel = Provider.of<ProfileViewModel>(context);
    return Consumer<PromotionController>(builder: (context, prc, child) {
      return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.imagesAppBg), fit: BoxFit.fill),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height * 0.02,
              ),
              const TextWidget(
                  title: 'Promotion',
                  fontWeight: FontWeight.w900,
                  fontSize: 18,
                  color: Colors.white),
              SizedBox(
                height: height * 0.01,
              ),
              TextWidget(
                  title:
                      "Rs ${promotionViewModel.promotionData != null ? promotionViewModel.promotionData!.data!.yesterdayTotalCommission : 0}",
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color: AppColors.whiteColor),
              SizedBox(
                height: height * 0.01,
              ),
              Container(
                margin: EdgeInsets.only(
                    left: width * 0.18,
                    right: width * 0.18,
                    bottom: height * 0.01),
                height: height * 0.04,
                decoration: BoxDecoration(
                    gradient: AppColors.appBarGradient2,
                    borderRadius: BorderRadius.circular(20)),
                child: const Center(
                  child: TextWidget(
                      title: "Yesterday's total commission",
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: AppColors.whiteColor),
                ),
              ),
              const TextWidget(
                  title: "Upgrade the level to increase level income",
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: AppColors.whiteColor),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: height * 0.04),
                  height: height * 0.35,
                  width: width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: AppColors.appBarGradient,
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: height * 0.06,
                        width: width * 0.9,
                        decoration: const BoxDecoration(
                            gradient: AppColors.appBarGradient,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              Assets.iconsAgFirst,
                              scale: 3,
                              color: AppColors.whiteColor,
                            ),
                            const Text(
                              "Direct Subordinate",
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.whiteColor,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Container(
                              height: height * 0.04,
                              width: 2,
                              color: Colors.white,
                            ),
                            Image.asset(
                              Assets.iconsAgSecond,
                              scale: 3,
                              color: AppColors.whiteColor,
                            ),
                            const Text(
                              "Team  Subordinate",
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.whiteColor,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                addTextColumn(
                                  '${promotionViewModel.promotionData != null ? promotionViewModel.promotionData!.data!.register : 0}',
                                  'Number of Register',
                                ),
                                addTextColumn(
                                  '${promotionViewModel.promotionData != null ? promotionViewModel.promotionData!.data!.depositNumber : 0}',
                                  'Deposit Number',
                                ),
                                addTextColumn(
                                  '${promotionViewModel.promotionData != null ? promotionViewModel.promotionData!.data!.depositAmount : 0}',
                                  'Deposit amount',
                                ),
                                addTextColumn(
                                  '${promotionViewModel.promotionData != null ? promotionViewModel.promotionData!.data!.firstDeposit : 0}',
                                  'Number of People making first deposit',
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                addTextColumn(
                                  '${promotionViewModel.promotionData != null ? promotionViewModel.promotionData!.data!.register : 0}',
                                  'Number of Register',
                                ),
                                addTextColumn(
                                  '${promotionViewModel.promotionData != null ? promotionViewModel.promotionData!.data!.depositNumber : 0}',
                                  'Deposit Number',
                                ),
                                addTextColumn(
                                  '${promotionViewModel.promotionData != null ? promotionViewModel.promotionData!.data!.depositAmount : 0}',
                                  'Deposit amount',
                                ),
                                addTextColumn(
                                  '${promotionViewModel.promotionData != null ? promotionViewModel.promotionData!.data!.firstDeposit : 0}',
                                  'Number of People making first deposit',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              AppBtn(
                height: height * 0.05,
                width: width * 0.9,
                titleColor: AppColors.whiteColor,
                hideBorder: true,
                gradient: AppColors.appButton,
                title: 'INVITATION LINK',
                fontSize: 18,
                fontWeight: FontWeight.w900,
                onTap: () async {
                  UserViewModel userViewModal = UserViewModel();
                  String? userId = await userViewModal.getUser();
                  if (userId != null) {
                    Share.share('${profileViewModel.profileData!.regRefLink}');
                  } else {
                    Utils.flushBarErrorMessage('Please login!', context);
                  }
                },
              ),
              SizedBox(
                height: height * 0.02,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: prc.promoItemList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () async {
                        if (index == 0) {
                          UserViewModel userViewModal = UserViewModel();
                          String? userId = await userViewModal.getUser();
                          if (userId != null) {
                            Launcher.copyToClipboard(
                                '${promotionViewModel.promotionData!.data!.referralCode}',
                                context);
                          } else {
                            Navigator.pushNamed(context, RoutesName.login);
                          }
                        } else {
                          Navigator.pushNamed(
                              context, prc.promoItemList[index].route!);
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            bottom: height * 0.01,
                            left: width * 0.05,
                            right: width * 0.05),
                        height: height * 0.08,
                        width: width * 0.7,
                        decoration: BoxDecoration(
                          gradient: AppColors.appBarGradient,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: ListTile(
                          leading: Image(
                            height: 30,
                            width: 30,
                            image: AssetImage(
                              prc.promoItemList[index].img,
                            ),
                          ),
                          title: TextWidget(
                            title: prc.promoItemList[index].title,
                            fontWeight: FontWeight.bold,
                            color: AppColors.whiteColor,
                            fontSize: 15,
                          ),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            size: 18,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
                    );
                  }),
              Container(
                width: width * 0.9,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    gradient: AppColors.appBarGradient,
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          Assets.iconsMoney,
                          scale: 2,
                        ),
                        SizedBox(
                          width: width * 0.02,
                        ),
                        const TextWidget(
                          title: 'Promotion data',
                          fontSize: 16,
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w800,
                        ),
                      ],
                    ),
                    addTextColumn(
                      '${promotionViewModel.promotionData != null ? promotionViewModel.promotionData!.data!.totalCommission : 0}',
                      'Total Commission',
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        addTextColumn(
                          '${promotionViewModel.promotionData != null ? promotionViewModel.promotionData!.data!.directSubordinate : 0}',
                          'Direct Subordinate',
                        ),
                        Container(
                          height: height * 0.06,
                          width: 1,
                          color: Colors.white,
                        ),
                        addTextColumn(
                          '${promotionViewModel.promotionData != null ? promotionViewModel.promotionData!.data!.teamSubordinate : 0}',
                          'Total number of\n'
                              'Subordinates in the team',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget addTextColumn(String value, String title) {
    return Container(
      width: width / 2.5,
      alignment: Alignment.center,
      child: Column(
        children: [
          TextWidget(
              title: value,
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: AppColors.whiteColor),
          TextWidget(
              textAlign: TextAlign.center,
              title: title,
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color: AppColors.whiteColor),
        ],
      ),
    );
  }
}
