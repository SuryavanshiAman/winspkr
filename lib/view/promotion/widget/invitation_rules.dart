import 'package:flutter/material.dart';
import 'package:wins_pkr/constants/gradient_app_bar.dart';
import 'package:wins_pkr/constants/app_colors.dart';
import 'package:wins_pkr/constants/text_widget.dart';
import 'package:wins_pkr/generated/assets.dart';
import 'package:wins_pkr/main.dart';

class InvitationRulesPage extends StatefulWidget {
  const InvitationRulesPage({super.key});

  @override
  State<InvitationRulesPage> createState() => _InvitationRulesPageState();
}

List<InvitationRule> itemsRuleList = [
  InvitationRule(
      text:
          'Only registered users can send invitations.             \nInvite friends who are 18 years or older.'),
  InvitationRule(
      text:
          'Use the unique invitation link found in your profile.\nShare via email, social media, or direct message.'),
  InvitationRule(
      text:
          "Earn rewards for each successful referral who registers and plays.\nBoth the inviter and the invitee receive bonus coins."),
  InvitationRule(
      text:
          "Do not spam or misuse the invitation system.\nInvitations must be to genuine friends or contacts."),
  InvitationRule(
      text:
          "We monitor invitation activity.\nMisuse can result in suspension of invitation privileges."),
];

class _InvitationRulesPageState extends State<InvitationRulesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        gradient: AppColors.appBarGradient,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.whiteColor,
              size: 15,
            )),
        title: const TextWidget(
          title: "Invitation Rules",
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColors.whiteColor,
        ),
      ),
      body: Container(
        height: height,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.imagesAppBg), fit: BoxFit.fill),
        ),
        child: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(
              height: height * 0.03,
            ),
            const TextWidget(
              title: "【Privacy Agreement】 program",
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: AppColors.whiteColor,
            ),
            SizedBox(
              height: height * 0.01,
            ),
            const TextWidget(
              title: "This activity is valid for a long time",
              fontWeight: FontWeight.bold,
              fontSize: 11,
              color: AppColors.whiteColor,
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: itemsRuleList.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(
                        top: height * 0.03,
                        bottom: height * 0.0,
                        left: width * 0.06,
                        right: width * 0.06),
                    padding: const EdgeInsets.all(15.0),
                    height: height * 0.14,
                    decoration: BoxDecoration(
                      gradient: AppColors.appBarGradient,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextWidget(
                      textAlign: TextAlign.start,
                      title: itemsRuleList[index].text,
                      fontSize: 15,
                      color: AppColors.whiteColor,
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}

class InvitationRule {
  String? text;

  InvitationRule({
    this.text,
  });
}
