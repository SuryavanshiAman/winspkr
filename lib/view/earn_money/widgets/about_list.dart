import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wins_pkr/constants/app_colors.dart';
import 'package:wins_pkr/constants/text_widget.dart';
import 'package:wins_pkr/main.dart';
import 'package:wins_pkr/view/earn_money/controller/earn_money_controller.dart';

class AboutList extends StatefulWidget {
  const AboutList({super.key});

  @override
  State<AboutList> createState() => _AboutListState();
}

class _AboutListState extends State<AboutList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<EarnMoneyController>(builder: (context, emc, child) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: height * 0.05,
            decoration: const BoxDecoration(
              gradient: AppColors.appBarGradient,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: width * 0.17,
                  child: const Center(
                    child: TextWidget(
                        title: 'Level',
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                SizedBox(
                  width: width * 0.25,
                  child: const Center(
                    child: TextWidget(
                        title: 'Bet Amount (Rs)',
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                SizedBox(
                  width: width * 0.25,
                  child: const Center(
                    child: TextWidget(
                        title: 'Active Member',
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                SizedBox(
                  width: width * 0.17,
                  child: const Center(
                    child: TextWidget(
                        title: 'Rate %',
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Container(
              height: 0.2,
              width: width,
              color: AppColors.whiteColor,
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: emc.peopleEarnList.length,
            itemBuilder: (context, index) {
              final res = emc.peopleEarnList[index];
              bool isEven = index % 2 == 0;
              return Container(
                decoration: BoxDecoration(
                  color:
                      isEven ? AppColors.lighterMaroon : AppColors.lightMarron,
                  border: const Border(
                      top: BorderSide(color: AppColors.whiteColor, width: 0.5)),
                  borderRadius: emc.peopleEarnList.length - 1 == index
                      ? const BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        )
                      : null,
                ),
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: width * 0.17,
                      child: Center(
                        child: Text(
                          res.title,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.25,
                      child: Center(
                        child: Text(
                          res.subtitle,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.25,
                      child: Center(
                        child: Text(
                          res.amount,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.17,
                      child: Center(
                        child: Text(
                          res.bet,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          SizedBox(
            height: height * 0.01,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: emc.aboutRuleList.length,
            itemBuilder: (context, index) {
              final res = emc.aboutRuleList[index];
              return ListTile(
                leading: Container(
                  height: 7,
                  width: 7,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.whiteColor),
                ),
                title: Text(
                  res,
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.whiteColor),
                ),
              );
            },
          ),
        ],
      );
    });
  }
}
