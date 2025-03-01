import 'package:wins_pkr/constants/app_button.dart';
import 'package:wins_pkr/constants/app_colors.dart';
import 'package:wins_pkr/constants/gradient_app_bar.dart';
import 'package:wins_pkr/generated/assets.dart';
import 'package:wins_pkr/main.dart';
import 'package:flutter/material.dart';
import 'package:wins_pkr/view/vip/widget/vip_text_widget.dart';
import 'package:provider/provider.dart';
import 'package:wins_pkr/view/vip/widget/vip_show_list.dart';
import 'package:wins_pkr/view/vip/widget/vip_tab.dart';
import 'package:wins_pkr/view_modal/user_view_modal.dart';
import 'package:wins_pkr/view_modal/vip_reward_receive_view_model.dart';
import 'package:wins_pkr/view_modal/vip_show_list_view_model.dart';


class TestWidget extends StatefulWidget {
  const TestWidget({super.key});

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final vipShLiViMo =
      Provider.of<VipShowListViewModel>(context, listen: false);
      vipShLiViMo.vipShowListApi(context);
    });
  }
  @override
  Widget build(BuildContext context) {
    final vipShLiViMo = Provider.of<VipShowListViewModel>(context);
    final rec=Provider.of<VipRewardReceiveViewModel>(context);
    return Scaffold(
      appBar: const GradientAppBar(
        leading: AppBackBtn(),
        centerTitle: true,
        title: Text(
          'VIP',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: AppColors.whiteColor),
        ),
      ),
      body: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(Assets.imagesAppBg),fit: BoxFit.fill)
        ),
        child: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(height: height*0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                topContainer(
                    '${vipShLiViMo.vipShowListModel != null ? vipShLiViMo.vipShowListModel!.myExperience : 19185}',
                    ' Exp',
                    'My Experience',
                    FontWeight.w500),
                topContainer(
                    '${vipShLiViMo.vipShowListModel != null ? vipShLiViMo.vipShowListModel!.daysCount : 24}',
                    ' days',
                    'Payout time',
                    FontWeight.w900),
              ],
            ),
            SizedBox(height: height*0.015),
            Container(
              alignment: Alignment.center,
              height: height * 0.05,
              width: width*0.93,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.whiteColor, width: 1),
                  borderRadius: BorderRadius.circular(5)),
              child: const VipTextWidget(
                  text:
                  'VIP level rewards are settled at 2:00 am on the 1st of every month',
                  color: Colors.grey,
                  fontSize: 11,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: height*0.015),
            const VipShowList(),
            SizedBox(height: height*0.015),
            Container(
              width: width*0.93,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                gradient: AppColors.appBarGradient2,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Image(
                        image: AssetImage(Assets.vipVipDiamond),
                        height: 25,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      VipTextWidget(
                          text:vipShLiViMo.vipShowListModel!=null?
                          'VIP${vipShLiViMo.vipShowListModel!.data![vipShLiViMo.vipIndexData].id} Benefits level':'',
                          fontWeight: FontWeight.w900,
                          fontSize: 18,
                          color: Colors.white)
                    ],
                  ),
                  const Divider(color: AppColors.dividerColor),
                  BenefitsWidget(
                      leImg: Assets.vipVipGift,
                      title: 'Level up rewards',
                      subTitle: 'Each account can only receive 1 time',
                      trIm1: Assets.iconsDepWallet,
                      trTi1:
                      vipShLiViMo.vipShowListModel!=null?'${vipShLiViMo.vipShowListModel!.data![vipShLiViMo.vipIndexData].levelUpRewards}':'',
                      trIm2: Assets.vipVipLove,
                      trTi2: '0'),
                  BenefitsWidget(
                      leImg: Assets.vipVipStarCoin,
                      title: 'Monthly rewards',
                      subTitle:
                      'Each account can only receive 1 time per month',
                      trIm1: Assets.iconsDepWallet,
                      trTi1:
                      vipShLiViMo.vipShowListModel!=null?'${vipShLiViMo.vipShowListModel!.data![vipShLiViMo.vipIndexData].monthlyRewards}':'',
                      trIm2: Assets.vipVipLove,
                      trTi2: '0')
                ],
              ),
            ),
            SizedBox(height: height*0.015),
            Container(
              width: width*0.93,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                gradient: AppColors.appBarGradient2,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  const Row(
                    children: [
                      Image(
                        image: AssetImage(Assets.vipVipCrown),
                        height: 25,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      VipTextWidget(
                          text: 'My benefits',
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                          color: Colors.white)
                    ],
                  ),
                  const Divider(color:AppColors.dividerColor),
                  if(vipShLiViMo.vipShowListModel!=null)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MyBenefits(
                          img: Assets.vipVipWellFare1,
                          trIm1: Assets.iconsDepWallet,
                          trTi1: '${vipShLiViMo.vipShowListModel!.data![vipShLiViMo.vipIndexData].levelUpRewards}',
                          trIm2: Assets.vipVipLove,
                          trTi2: '0',
                          title: 'Level up rewards',
                          subTitle: 'Each account can only receive 1 time',
                          status: vipShLiViMo.vipShowListModel!.data![vipShLiViMo.vipIndexData].levelUpStatus,
                          levelId: vipShLiViMo.vipShowListModel!.data![vipShLiViMo.vipIndexData].id!,
                          onTap: () async {
                            //receive reward
                            final status=vipShLiViMo.vipShowListModel!.data![vipShLiViMo.vipIndexData].levelUpStatus;
                            UserViewModel userViewModel = UserViewModel();
                            String? token = await userViewModel.getUser();
                            Map data = {
                              "userid": token,
                              "level_id": '${vipShLiViMo.vipShowListModel!.data![vipShLiViMo.vipIndexData].id}',
                              "level_up_rewards": '${vipShLiViMo.vipShowListModel!.data![vipShLiViMo.vipIndexData].levelUpRewards}',
                            };
                            if(status==1){
                              rec.vipRewardReceiveApi(data, context);
                            }
                          },
                        ),
                        MyBenefits(
                          img: Assets.vipVipWellFare2,
                          trIm1: Assets.iconsDepWallet,
                          trTi1: '${vipShLiViMo.vipShowListModel!.data![vipShLiViMo.vipIndexData].monthlyRewards}',
                          trIm2: Assets.vipVipLove,
                          trTi2: '0',
                          title: 'Monthly rewards',
                          subTitle:
                          'Each account can only receive 1 time per month',
                          status: vipShLiViMo.vipShowListModel!.data![vipShLiViMo.vipIndexData].monthlyRewardsStatus!,
                          levelId: vipShLiViMo.vipShowListModel!.data![vipShLiViMo.vipIndexData].id!,
                          onTap: () async {
                            //receive reward
                            final status=vipShLiViMo.vipShowListModel!.data![vipShLiViMo.vipIndexData].monthlyRewardsStatus;
                            UserViewModel userViewModel = UserViewModel();
                            String? token = await userViewModel.getUser();
                            Map data = {
                              "userid": token,
                              "level_id": '${vipShLiViMo.vipShowListModel!.data![vipShLiViMo.vipIndexData].id}',
                              "monthly_rewards": '${vipShLiViMo.vipShowListModel!.data![vipShLiViMo.vipIndexData].monthlyRewards}'
                            };
                            if(status==1){
                              rec.vipRewardReceiveApi(data, context);
                            }
                          },
                        ),
        
                      ],
                    )
                ],
              ),
            ),
            const SizedBox(height: 10),
            const VipTab(),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  topContainer(String title, String title1, String subTitle,
      FontWeight fontWeight) {
    return Container(
      height: height * 0.08,
      width: width * 0.45,
      decoration: BoxDecoration(
          color: AppColors.lightMarron,
          borderRadius: BorderRadiusDirectional.circular(5)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              VipTextWidget(
                  text: title,
                  fontSize: 15,
                  fontWeight: fontWeight,
                  color: AppColors.whiteColor),
              VipTextWidget(
                  text: title1,
                  fontSize: 14,
                  color: AppColors.whiteColor),
            ],
          ),
          VipTextWidget(
              text: subTitle,
              fontSize: 12,
              fontWeight: FontWeight.w900,
              color: AppColors.whiteColor),
        ],
      ),
    );
  }
}

class BenefitsWidget extends StatelessWidget {
  final String leImg;
  final String title;
  final String subTitle;
  final String trIm1;
  final String trTi1;
  final String trIm2;
  final String trTi2;
  const BenefitsWidget(
      {super.key,
        required this.leImg,
        required this.title,
        required this.subTitle,
        required this.trIm1,
        required this.trTi1,
        required this.trIm2,
        required this.trTi2});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(leImg),fit: BoxFit.fill)
        ),
      ),
      title: VipTextWidget(
          text: title,
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: Colors.white),
      subtitle: VipTextWidget(text: subTitle, color: Colors.white),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            alignment: Alignment.center,
            height: height * 0.03,
            width: width * 0.2,
            padding: const EdgeInsets.only(left: 5,right: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: AppColors.dividerColor)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(
                  image: AssetImage(trIm1),
                  height: 16,
                ),
                VipTextWidget(
                    text: trTi1,
                    color: AppColors.whiteColor,
                    fontSize: 13)
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: height * 0.03,
            width: width * 0.2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: AppColors.dividerColor)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image(
                    image: AssetImage(trIm2),
                    height: 16,
                  ),
                  FittedBox(
                    child: VipTextWidget(
                        text: trTi2,
                        color: AppColors.whiteColor,
                        fontSize: 15),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MyBenefits extends StatelessWidget {
  final String img;
  final String trIm1;
  final String trTi1;
  final String trIm2;
  final String trTi2;
  final String title;
  final String subTitle;
  final int status;
  final int levelId;
  final VoidCallback onTap;
  const MyBenefits(
      {super.key,
        required this.img,
        required this.trIm1,
        required this.trTi1,
        required this.trIm2,
        required this.trTi2,
        required this.title,
        required this.subTitle,
        required this.status,
        required this.levelId, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: width/2.3,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10), topLeft: Radius.circular(10)),
            color: AppColors.lightMarron,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: height * 0.2,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10)),
                  gradient: AppColors.loginSecondaryGrad,
                ),
                child: Column(
                  children: [
                    Container(
                      height: height * 0.17,
                      decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage(img))),
                    ),
                    Container(
                      height: height * 0.03,
                      decoration: const BoxDecoration(
                        gradient: AppColors.buttonGradient2,
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            trIm1,
                            height: 14,
                          ),
                          VipTextWidget(
                            text: trTi1,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: AppColors.whiteColor,
                            maxLines: 1,
                          ),
                          const Spacer(),
                          Image.asset(
                            trIm2,
                            height: 14,
                          ),
                          VipTextWidget(
                            text: trTi2,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: AppColors.whiteColor,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8),
                child: VipTextWidget(
                  text: title,
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  color: AppColors.whiteColor,
                  maxLines: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8,bottom: 5),
                child: VipTextWidget(
                  text: subTitle,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: AppColors.dividerColor,
                  maxLines: 2,
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        AppBtn(
          title: 'Received',
          fontSize: 20,
          onTap:onTap,
          hideBorder: true,
          gradient: status==1?AppColors.goldenGradient:AppColors.boxGradient,
          height: 40,
          width: width/2.5,
          titleColor: status==1?AppColors.marronBlack:AppColors.whiteColor,
        ),
        const SizedBox(height: 8)
      ],
    );
  }
}