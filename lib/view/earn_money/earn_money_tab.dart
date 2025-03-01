import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wins_pkr/constants/app_colors.dart';
import 'package:wins_pkr/constants/constant_widgets/app_bar.dart';
import 'package:wins_pkr/constants/text_widget.dart';
import 'package:wins_pkr/generated/assets.dart';
import 'package:wins_pkr/main.dart';
import 'package:wins_pkr/view/earn_money/controller/earn_money_controller.dart';
import 'package:wins_pkr/view/earn_money/widgets/about_widget.dart';
import 'package:wins_pkr/view/earn_money/widgets/history_widget.dart';
import 'package:wins_pkr/view/earn_money/widgets/redeem_gift_widget.dart';

class EarnMoneyTab extends StatelessWidget {
  const EarnMoneyTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarPage(),
      body: Consumer<EarnMoneyController>(builder: (context, emc, child) {
        return Container(
          height: height,
          width: width,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.imagesAppBg), fit: BoxFit.fill),
          ),
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(10),
            physics: const ScrollPhysics(),
            children: [
              const TabList(),
              const SizedBox(height: 10),
              if (emc.tabIndex == 0)
                const AboutWidget()
              else if (emc.tabIndex == 1)
                const HistoryWidget()
              else
                const RedeemGiftWidget()
              // else if (emc.tabIndex == 2)
              //   const DailyWidget()
              // else
              //   const EarnWidget(),

            ],
          ),
        );
      }),
    );
  }
}

class TabList extends StatelessWidget {
  const TabList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<EarnMoneyController>(
      builder: (context, emc, child) {
        return SizedBox(
          height: height*0.07,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: emc.tabDataList.length,
            itemBuilder: (context, i) {
              return InkWell(
                onTap: () {
                  emc.setTabIndex(i);
                },
                child: Container(
                  width: width * 0.3,
                  margin: EdgeInsets.only(right: i!=emc.tabDataList.length-1?10:0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: emc.tabIndex == i
                        ? AppColors.lightMarron
                        : Colors.transparent,
                    border: Border.all(
                      color: emc.tabIndex == i
                          ? Colors.transparent
                          : AppColors.greyColor,
                      width: 2,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        emc.tabDataList[i].icon,
                        size: 20,
                        color: emc.tabIndex == i
                            ? AppColors.whiteColor
                            : AppColors.lightBlack,
                      ),
                      TextWidget(
                        title: emc.tabDataList[i].title,
                        fontWeight: FontWeight.bold,
                        color: emc.tabIndex == i
                            ? AppColors.whiteColor
                            : AppColors.lightBlack,
                        fontSize: 14,
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
