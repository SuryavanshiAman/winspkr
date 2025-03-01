import 'package:flutter/material.dart';
import 'package:wins_pkr/constants/app_button.dart';
import 'package:wins_pkr/constants/app_colors.dart';
import 'package:wins_pkr/constants/constant_widgets/gradient_text.dart';
import 'package:wins_pkr/constants/text_widget.dart';
import 'package:wins_pkr/generated/assets.dart';
import 'package:wins_pkr/main.dart';

class EarnWidget extends StatelessWidget {
  const EarnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: height * 0.2,
          width: width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Assets.imagesEarnmonyAbout),
                  fit: BoxFit.fill)),
        ),
         const GradientText(
          'Invite to Earn',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
          gradient: AppColors.gradientText,
        ),
        SizedBox(
          height: height * 0.02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: height * 0.05,
              width: width * 0.1,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.lightBlack),
              child: const Center(
                  child: TextWidget(
                    title: '1',
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: AppColors.whiteColor
                  )),
            ),
            SizedBox(
              width: width * 0.8,
              child: const GradientText(
                'Share your referral link or QR code below',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900),
                gradient: AppColors.gradientText,
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 15,left: 10),
          child: TextWidget(
            title: "Just copy or screenshot and send it to your friends",
            fontSize: 10,
            color: AppColors.whiteColor,
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: height * 0.05,
              width: width * 0.1,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.lightBlack),
              child: const Center(
                  child: TextWidget(
                      title: '2',
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: AppColors.whiteColor
                  )),
            ),
            SizedBox(
              width: width * 0.8,
              child: const GradientText(
                'Get your friends to start playing',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900),
                gradient: AppColors.gradientText,
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 15,left: 10),
          child: TextWidget(
            title: "You can check your referred friends who registered with your code",
            fontSize: 10,
            color: AppColors.whiteColor,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: height * 0.05,
              width: width * 0.1,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.lightBlack),
              child: const Center(
                  child: TextWidget(
                      title: '3',
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: AppColors.whiteColor
                  )),
            ),
            SizedBox(
              width: width * 0.8,
              child: const GradientText(
                'Start earning daily commission',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900),
                gradient: AppColors.gradientText,
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 15,left: 10),
          child: TextWidget(
            textAlign: TextAlign.start,
            title: "You will be rewarded, regardless if they win or lose. The more friends you\n"
                "refer to SkyAce Club, the bigger your daily reward. Start earning daily\n"
                "commissions.",
            fontSize: 10,
            color: AppColors.whiteColor,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          alignment: Alignment.center,
          height: height*0.05,
          width: width*0.9,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Assets.imagesAgencyPolicyBg),
                  fit: BoxFit.fill)),
          child:  const Center(
            child: Text(
              'My Referral Link',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                  color: AppColors.whiteColor),
            ),
          ),

        ),
        Container(
          margin: const EdgeInsets.all(10),
          height: height*0.3,
          width: width,
          decoration: BoxDecoration(
            color: AppColors.lightMarron,
            borderRadius: BorderRadius.circular(10)
          ),
          child: Column(
            children: [
              Container(
                height: height*0.05,
                width: width,
                decoration: const BoxDecoration(
                  color: AppColors.lighterMaroon,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:
                  [
                    TextWidget(title: 'Copy Link',fontSize: 15,color: AppColors.whiteColor,),
                    Icon(Icons.copy,size: 18,color: AppColors.whiteColor,),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                height: height*0.15,
                width: width*0.35,
                decoration: BoxDecoration(
                  color: AppColors.greyColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(
                height: height*0.01,
              ),
              AppBtn(
                onTap: () {},
                height: height * 0.04,
                width: width * 0.25,
                title: 'Save',
                titleColor: AppColors.whiteColor,
                fontSize: 15,
                fontWeight: FontWeight.bold,
                gradient: AppColors.appButton,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
