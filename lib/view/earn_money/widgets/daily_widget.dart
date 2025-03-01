import 'package:flutter/material.dart';
import 'package:wins_pkr/constants/app_colors.dart';
import 'package:wins_pkr/res/no_data_found.dart';
import 'package:wins_pkr/constants/text_widget.dart';
import 'package:wins_pkr/generated/assets.dart';
import 'package:wins_pkr/main.dart';

class DailyWidget extends StatelessWidget {
  const DailyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const TextWidget(
              title: 'My Team (Yesterday)',
              fontSize: 15,
              fontFamily: "open_sans_reg",
              color: AppColors.whiteColor,
              fontWeight: FontWeight.bold,
            ),
            Container(
              height: height*0.015,
              width: width*0.035,
              decoration: const BoxDecoration(
              color: Colors.pinkAccent,
              ),
            ),
            const TextWidget(
              title: 'Member',
              fontSize: 14,
              fontFamily: "open_sans_reg",
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
            Container(
              height: height*0.015,
              width: width*0.035,
              decoration: const BoxDecoration(
                color: AppColors.darkYellow,
              ),
            ),
            const TextWidget(
              title: 'Bet Amount',
              fontSize: 14,
              fontFamily: "open_sans_reg",
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      const SizedBox(height: 10),
      Container(
        height: height*0.2,
        width: width,
        decoration:  BoxDecoration(
          gradient: AppColors.appBarGradient2,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: height*0.01,
            ),
            Container(
              height: height*0.025,
              width: width*0.9,
              decoration: BoxDecoration(
                color: AppColors.greyColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(Icons.circle,size: 10,color: AppColors.whiteColor,),
                  const TextWidget(
                    title: '0',
                    fontSize: 15,
                    fontFamily: "open_sans_reg",
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    width: width*0.35,
                  ),
                  const TextWidget(
                    title: '0/0',
                    fontSize: 15,
                    fontFamily: "open_sans_reg",
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    width: width*0.35,
                  ),
                  const TextWidget(
                    title: '0',
                    fontSize: 15,
                    fontFamily: "open_sans_reg",
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                  const Icon(Icons.circle,size: 10,color: AppColors.whiteColor,),
                ],
              ),
            ),
            Container(
              height: height*0.025,
              width: width*0.9,
              decoration: BoxDecoration(
                color: AppColors.greyColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(Icons.circle,size: 10,color: AppColors.whiteColor,),
                  const TextWidget(
                    title: '0',
                    fontSize: 15,
                    fontFamily: "open_sans_reg",
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    width: width*0.35,
                  ),
                  const TextWidget(
                    title: '0/0',
                    fontSize: 15,
                    fontFamily: "open_sans_reg",
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    width: width*0.35,
                  ),
                  const TextWidget(
                    title: '0',
                    fontSize: 15,
                    fontFamily: "open_sans_reg",
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                  const Icon(Icons.circle,size: 10,color: AppColors.whiteColor,),
                ],
              ),
            ),
            Container(
              height: height*0.025,
              width: width*0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    title: '0%',
                    fontSize: 15,
                    fontFamily: "open_sans_reg",
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                  TextWidget(
                    title: '0%',
                    fontSize: 15,
                    fontFamily: "open_sans_reg",
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
            Container(
              height: height*0.025,
              width: width*0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    title: 'Rate',
                    fontSize: 15,
                    fontFamily: "open_sans_reg",
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                  TextWidget(
                    title: 'Rate',
                    fontSize: 15,
                    fontFamily: "open_sans_reg",
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: height * 0.03,
                  width: width * 0.06,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.green),
                  child:  const Icon(
                    Icons.check,
                    color: AppColors.whiteColor,
                    size: 15,
                  ),
                ),
                Container(
                  height: 1,
                  width: width * 0.8,
                  color: AppColors.lightBlack,
                ),
                Container(
                  height: height * 0.03,
                  width: width * 0.06,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.lightBlack, width: 2)
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height*0.01,
            ),
          ],
        ),
      ),
        const SizedBox(height: 10),
        const TextWidget(
          textAlign: TextAlign.start,
          title: 'Yesterday Report (Total)',
          fontSize: 15,
          fontFamily: "open_sans_reg",
          color: AppColors.whiteColor,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(height: 10),
        Container(
          height: height*0.1,
          width: width,
          decoration: BoxDecoration(
            gradient: AppColors.appBarGradient2,
            borderRadius: BorderRadius.circular(10),
          ),
          child:  Row(
            children: [
              SizedBox(
                width: width * 0.02,
              ),
              Container(
                height: height*0.035,
                width: width*0.075,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(Assets.iconsLevel),
                        fit: BoxFit.fill)),
              ),
              SizedBox(
                width: width * 0.02,
              ),
              const TextWidget(
                title: 'Level:',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  fontFamily: "open_sans_reg",
                    color: AppColors.whiteColor
              ),
              const Spacer(),
              const TextWidget(
                title: '0',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.whiteColor,
                fontFamily: "open_sans_reg",
              ),
              SizedBox(
                width: width * 0.05,
              ),
              Container(
                height: height * 0.07,
                width: 0.8,
                color: AppColors.lightBlack,
              ),
              SizedBox(
                width: width * 0.05,
              ),
              Container(
                height: height*0.035,
                width: width*0.075,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(Assets.iconsRate),
                        fit: BoxFit.fill)),
              ),
              SizedBox(
                width: width * 0.02,
              ),
              const TextWidget(
                title:  'Rate:',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  fontFamily: "open_sans_reg",
                    color: AppColors.whiteColor
              ),
              const Spacer(),
              const TextWidget(
                title: '0',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  fontFamily: "open_sans_reg",
                    color: AppColors.whiteColor
              ),
              SizedBox(
                width: width * 0.02,
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(14),
          height: height*0.15,
          width: width,
          decoration: const BoxDecoration(
              gradient: AppColors.appBarGradient2,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Row(
            children: [
              SizedBox(
                width: width * 0.37,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 25,
                          width: 25,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image:
                                  AssetImage(Assets.iconsWallet),
                                  fit: BoxFit.fill)),
                        ),
                        SizedBox(
                          width: width * 0.02,
                        ),
                        SizedBox(
                          width: width * 0.28,
                          child: const TextWidget(
                            title: 'Team betting amount:',
                                fontSize: 14,
                                fontWeight: FontWeight.w900,
                                color: AppColors.whiteColor
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    const Row(
                      children: [
                        Spacer(),
                        TextWidget(
                          title: 'Rs 0',
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                              color: AppColors.whiteColor
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //   const Spacer(),

              SizedBox(
                width: width * 0.05,
              ),
              Container(
                height: height * 0.1,
                width: 0.8,
                color: AppColors.lightBlack,
              ),
              SizedBox(
                width: width * 0.05,
              ),
              SizedBox(
                width: width * 0.37,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 25,
                          width: 25,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(Assets.iconsRebate),
                                  fit: BoxFit.fill)),
                        ),
                        SizedBox(
                          width: width * 0.02,
                        ),
                        SizedBox(
                          width: width * 0.28,
                          child: const TextWidget(
                            title: 'Team rebate:',
                                fontSize: 14,
                                fontWeight: FontWeight.w900,
                                color: AppColors.whiteColor
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    const Row(
                      children: [
                        Spacer(),
                        TextWidget(
                          title: 'Rs 0',
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                              color: AppColors.whiteColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(14),
          height: height*0.15,
          width: width,
          decoration: const BoxDecoration(
              gradient: AppColors.appBarGradient2,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Row(
            children: [
              SizedBox(
                width: width * 0.37,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 25,
                          width: 25,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image:
                                  AssetImage(Assets.iconsWallet),
                                  fit: BoxFit.fill)),
                        ),
                        SizedBox(
                          width: width * 0.02,
                        ),
                        SizedBox(
                          width: width * 0.28,
                          child: const TextWidget(
                              title: 'Team betting amount:',
                              fontSize: 14,
                              fontWeight: FontWeight.w900,
                              color: AppColors.whiteColor
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    const Row(
                      children: [
                        Spacer(),
                        TextWidget(
                            title: 'Rs 0',
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            color: AppColors.whiteColor
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //   const Spacer(),

              SizedBox(
                width: width * 0.05,
              ),
              Container(
                height: height * 0.1,
                width: 0.8,
                color: AppColors.lightBlack,
              ),
              SizedBox(
                width: width * 0.05,
              ),
              SizedBox(
                width: width * 0.37,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 25,
                          width: 25,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(Assets.iconsRebate),
                                  fit: BoxFit.fill)),
                        ),
                        SizedBox(
                          width: width * 0.02,
                        ),
                        SizedBox(
                          width: width * 0.28,
                          child: const TextWidget(
                              title: 'Team rebate:',
                              fontSize: 14,
                              fontWeight: FontWeight.w900,
                              color: AppColors.whiteColor
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    const Row(
                      children: [
                        Spacer(),
                        TextWidget(
                          title: 'Rs 0',
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          color: AppColors.whiteColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Container(
          height: height*0.08,
          width: width,
          decoration: BoxDecoration(
            gradient: AppColors.appBarGradient2,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10),
                height: height*0.03,
                width: width*0.065,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image:
                        AssetImage(Assets.iconsWallet),
                        fit: BoxFit.fill)),
              ),
              SizedBox(
                width: width*0.3,
                child: const TextWidget(
                  title: 'Total Rebate',
                  fontFamily: "open_sans_reg",
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.whiteColor,
                ),
              ),
              const Spacer(),
              SizedBox(
                width: width*0.1,
                child: const TextWidget(
                  title: 'Rs 0',
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  color: AppColors.whiteColor,
                ),
              ),
            ],
          ),
        ),
        const Center(child: NoDataFoundPage()),
      ],
    );
  }
}
