import 'package:flutter/material.dart';
import 'package:wins_pkr/constants/app_button.dart';
import 'package:wins_pkr/constants/app_colors.dart';
import 'package:wins_pkr/constants/constant_widgets/app_bar.dart';
import 'package:wins_pkr/generated/assets.dart';
import 'package:wins_pkr/main.dart';
import 'package:wins_pkr/res/circular_progress_indicator.dart';
import 'package:wins_pkr/view/deposit/widgets/deposit.dart';
import 'package:wins_pkr/view/deposit/widgets/withdraw.dart';
import 'package:wins_pkr/view/me/widgets/order_page.dart';
import 'package:wins_pkr/view_modal/deposit_view_modal.dart';
import 'package:wins_pkr/view_modal/profile_view_model.dart';
import 'package:wins_pkr/view_modal/user_view_modal.dart';
import 'package:provider/provider.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    final userProfileViewModel = Provider.of<ProfileViewModel>(context);
    final depositViewModel = Provider.of<DepositViewModel>(context);
    return FutureBuilder<String?>(
      future: Provider.of<UserViewModel>(context, listen: false).getUser(),
      builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(strokeWidth: 2),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final mainWallet = userProfileViewModel
              .profileData?.data?.wallet + userProfileViewModel
              .profileData?.data?.thirdPartyWallet;
          return Scaffold(
            backgroundColor: AppColors.scaffoldDark,
            appBar: const AppBarPage(),
            body: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Assets.imagesAppBg), fit: BoxFit.fill),
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: height * 0.2,
                        width: width,
                        child: Column(
                          children: [
                            SizedBox(
                              height: height * 0.04,
                            ),
                            Container(
                              height: height * 0.07,
                              width: width * 0.16,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(Assets.iconsWallets),
                                    fit: BoxFit.contain,
                                  )),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('Rs ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 28,
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                                Text(
                                  mainWallet== null
                                      ? '0.00'
                                      : mainWallet.toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 28,
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                              ],
                            ),
                            const Text(
                              'Total Balance',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: AppColors.whiteColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Padding(
                          padding: EdgeInsets.only(top: height * 0.2),
                          child: Container(
                            width: width,
                            decoration: const BoxDecoration(
                                gradient: AppColors.appBarGradient,
                                borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    percentage(
                                        (userProfileViewModel
                                            .profileData?.data?.wallet/(mainWallet*0.01)).toStringAsFixed(2),

                                        userProfileViewModel
                                            .profileData?.data?.wallet==null?0: userProfileViewModel
                                            .profileData?.data?.wallet.toStringAsFixed(2),
                                        'Main wallet'),
                                    percentage(
                                        (userProfileViewModel
                                            .profileData?.data?.thirdPartyWallet/(mainWallet*0.01)).toStringAsFixed(2),
                                        userProfileViewModel
                                            .profileData?.data?.thirdPartyWallet==null?0: userProfileViewModel
                                            .profileData?.data?.thirdPartyWallet.toStringAsFixed(2),
                                        '3rd party wallet'),
                                  ],
                                ),
                                SizedBox(
                                  height: height * 0.03,
                                ),
                                AppBtn(
                                    height: height * 0.06,
                                    title: 'Main wallet transfer',
                                    titleColor: AppColors.whiteColor,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w900,
                                    borderRadius: 20,
                                    onTap: () {
                                      depositViewModel.mainWalletTransfer(context);
                                    },
                                    hideBorder: true,
                                    gradient: AppColors.appButton),
                                SizedBox(
                                  height: height * 0.05,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    groups(
                                      Assets.iconsProDeposit,
                                      'Deposit',
                                          () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                const Deposit()));
                                      },
                                    ),
                                    groups(
                                      Assets.iconsProWithdraw,
                                      'Withdrawal',
                                          () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                const Withdraw()));
                                      },
                                    ),
                                    groups(
                                      Assets.iconsRechargeHistory,
                                      'Deposit\n history',
                                          () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const OrderScreen(initialIndex: 1,)));
                                      },
                                    ),
                                    groups(
                                      Assets.iconsWithdrawHistory,
                                      'Withdrawal\n     history',
                                          () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const OrderScreen(initialIndex: 0,)));
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: height * 0.05,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }

  Widget percentage(String percentData, String amount, String title) {
    double? percentage;
    try {
      percentage = double.parse(percentData) / 100;
    } catch (e) {
      percentage = 0;
    }

    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        CircularPercentIndicator(
          animation: true,
          animationDuration: 1200,
          lineWidth: 10.0,
          startAngle: 8.0,
          radius: 120,
          circularStrokeCap: CircularStrokeCap.round,
          linearGradient: AppColors.buttonGradient4,
          percent: percentage.isNaN ? 0 : percentage,
          center: CircleAvatar(
            radius: 50,
            backgroundColor: Colors.transparent,
            child: Text(
              percentage.isNaN
                  ? "0.00%"
                  : '${(percentage * 100).toStringAsFixed(2)}%',
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Rs ',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 16,
                color: AppColors.lightWhite,
              ),
            ),
            Text(
              amount,
              style: const TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 16,
                color: AppColors.lightWhite,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: AppColors.whiteColor,
          ),
        ),
      ],
    );
  }

  groups(String img, String title, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: height * 0.08,
            width: width * 0.16,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors.scaffoldDark,
            ),
            child: Center(
              child: Image.asset(
                img,
                height: 40,
              ),
            ),
            //color: Colors.white,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            title,
            style: const TextStyle(
                color: AppColors.lightWhite,
                fontSize: 14,
                fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
