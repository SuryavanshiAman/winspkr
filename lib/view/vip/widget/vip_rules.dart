import 'package:flutter/material.dart';
import 'package:wins_pkr/constants/app_colors.dart';
import 'package:wins_pkr/generated/assets.dart';
import 'package:wins_pkr/main.dart';
import 'package:wins_pkr/view/vip/widget/vip_text_widget.dart';



class VipRules extends StatelessWidget {
  const VipRules({super.key});

  @override
  Widget build(BuildContext context) {
    List<VipRule> ruleData = [
      VipRule(
        title: 'Upgrade standard',
        description:
            "The IP member's experience points (valid bet amount) that meet the requirements of the corresponding rank will be promoted to the corresponding VIP level, the member's VIP data statistics period starts from 00:00:00 days VIP system launched.VIP level calculation is refreshed every 10 minutes! The corresponding experience level is calculated according to valid odds 1:1 !",
      ),
      VipRule(
          title: 'Upgrade order',
          description:
              "The VIP level that meets the corresponding requirements can be promoted by one level every day, but the VIP level cannot be promoted by leapfrogging."),
      VipRule(
          title: 'Level maintenance',
          description:
              'VIP members need to complete the maintenance requirements of the corresponding level within 30 days after the "VIP level change"; if the promotion is completed during this period, the maintenance requirements will be calculated according to the current level.'),
      VipRule(
          title: 'Downgrade standard',
          description:
              "If a VIP member fails to complete the corresponding level maintenance requirements within 30 days, the system will automatically deduct the experience points corresponding to the level. If the experience points are insufficient, the level will be downgraded, and the corresponding discounts will be adjusted to the downgraded level accordingly."),
      VipRule(
          title: 'Upgrade Bonus',
          description:
              "The upgrade benefits can be claimed on the VIP page after the member reaches the VIP membership level, and each VIP member can only get the upgrade reward of each level once."),
      VipRule(
          title: 'Monthly reward',
          description:
              "VIP members can earn the highest level of VIP rewards once a month.Can only be received once a month. Prizes cannot be accumulated. And any unclaimed rewards will be refreshed on the next settlement day. When receiving the highest level of monthly rewards this month Monthly Rewards earned in this month will be deducted e.g. when VIP1 earns 500 and upgrades to VIP2 to receive monthly rewards 500 will be deducted."),
      VipRule(
          title: 'Real-time rebate',
          description:
              "The higher the VIP level, the higher the return rate, all the games are calculated in real time and can be self-rewarded!"),
      VipRule(
          title: 'Safe',
          description:
              "VIP members who have reached the corresponding level will get additional benefits on safe deposit based on the member's VIP level."),
    ];
    return Container(
      width: width*0.93,
      decoration: BoxDecoration(
          color: AppColors.lightMarron, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          SizedBox(
            height: height * 0.02,
          ),
          const Center(
              child: VipTextWidget(
                  text: 'VIP privileges',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppColors.whiteColor)),
          SizedBox(
            height: height * 0.01,
          ),
          const Center(
              child: VipTextWidget(
                  text: 'VIP rule description',
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: AppColors.dividerColor)),
          SizedBox(
            height: height * 0.02,
          ),
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: ruleData.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 1.2),
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: AppColors.lightMarron,
                              border: Border.all(
                                  color: AppColors.dividerColor,
                                  width: 0.5),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 30, 8, 20),
                            child: VipTextWidget(
                                text: ruleData[index].description.toString(),
                                fontSize: 15,
                                color: AppColors.whiteColor,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      Positioned(
                        top: -20,
                        child: Container(
                          height: height * 0.05,
                          width: width * 0.6,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(Assets.vipRulesHeader),
                                  fit: BoxFit.fill)),
                          child: Text(
                            ruleData[index].title.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 14,
                                color: AppColors.marronBlack),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              })
        ],
      ),
    );
  }
}

class VipRule {
  final String description;
  final String title;

  VipRule({
    required this.description,
    required this.title,
  });
}
