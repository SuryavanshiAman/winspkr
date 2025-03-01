import 'package:flutter/material.dart';
import 'package:wins_pkr/view/vip/widget/vip_text_widget.dart';
import 'package:provider/provider.dart';
import 'package:wins_pkr/constants/app_button.dart';
import 'package:wins_pkr/constants/app_colors.dart';
import 'package:wins_pkr/generated/assets.dart';
import 'package:wins_pkr/main.dart';
import 'package:wins_pkr/view_modal/vip_reward_his_view_model.dart';

class VipHistory extends StatefulWidget {
  const VipHistory({super.key});

  @override
  State<VipHistory> createState() => _VipHistoryState();
}

class _VipHistoryState extends State<VipHistory> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final res = Provider.of<VipRewardHisViewModel>(context, listen: false);
      res.vipRewardHisApi(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final res = Provider.of<VipRewardHisViewModel>(context);
    return Container(
      width: width * 0.93,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: AppColors.loginSecondaryGrad1),
      child: res.vipRewardHisModel != null
          ? Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: res.vipRewardHisModel!.data!.length,
                  padding: const EdgeInsets.fromLTRB(8, 15, 8, 0),
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Experience Bonus',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 17,
                              color: Colors.blue),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        const Text(
                          'Betting EXP',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                              color: AppColors.dividerColor),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Row(
                          children: [
                            Text(
                              '${res.vipRewardHisModel!.data![index].createdAt}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                  color: AppColors.dividerColor),
                            ),
                            const Spacer(),
                            Text(
                              '${res.vipRewardHisModel!.data![index].exp} EXP',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                  color: Colors.green),
                            ),
                          ],
                        ),
                        const Divider(
                          color: AppColors.dividerColor,
                        ),
                      ],
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 15, 20, 10),
                  child: AppBtn(
                    title: 'View All',
                    fontSize: 20,
                    titleColor: AppColors.whiteColor,
                    onTap: () {},
                    gradient: AppColors.loginSecondaryGrad,
                  ),
                ),
              ],
            )
          : Container(
              width: width,
              height: height * 0.3,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(Assets.imagesNoDataAvailable, scale: 2),
                  const VipTextWidget(
                      text: 'No data Available!',
                      color: Colors.white,
                      fontSize: 14),
                ],
              ),
            ),
    );
  }
}
