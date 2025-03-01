import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:wins_pkr/constants/app_button.dart';
import 'package:wins_pkr/constants/app_colors.dart';
import 'package:wins_pkr/constants/custom_text_field.dart';
import 'package:wins_pkr/generated/assets.dart';
import 'package:wins_pkr/main.dart';
import 'package:wins_pkr/utils/routes/routers_name.dart';
import 'package:wins_pkr/utils/utils.dart';
import 'package:wins_pkr/view_modal/redeem_gift_his_view_model.dart';
import 'package:wins_pkr/view_modal/redeem_gift_view_model.dart';
import 'package:wins_pkr/view_modal/user_view_modal.dart';

class RedeemGiftWidget extends StatefulWidget {
  const RedeemGiftWidget({super.key});

  @override
  State<RedeemGiftWidget> createState() => _RedeemGiftWidgetState();
}

class _RedeemGiftWidgetState extends State<RedeemGiftWidget> {
  TextEditingController giftCodeCon = TextEditingController();
  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
    UserViewModel userViewModal = UserViewModel();
    String? userId = await userViewModal.getUser();
    if (userId != null) {
      final reGiftHisViewModel =
          Provider.of<RedeemGiftHisViewModel>(context, listen: false);
      reGiftHisViewModel.redeemGiftHisApi(context);
    } else {
      if (kDebugMode) {
        print('User Not login!');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final redeemGiftHisViewModel = Provider.of<RedeemGiftHisViewModel>(context);
    final redeemGiftViewModel = Provider.of<RedeemGiftViewModel>(context);
    return ListView(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      children: [
        Container(
          height: height / 3.5,
          width: width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              gradient: AppColors.appBarGradient,
              image: const DecorationImage(
                image: AssetImage(Assets.imagesGift),
              )),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: AppColors.appBarGradient),
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Hi',
                    style:
                        TextStyle(fontSize: 14, color: AppColors.whiteColor)),
                SizedBox(
                  height: height * 0.02,
                ),
                const Text('We have a gift for you',
                    style:
                        TextStyle(fontSize: 14, color: AppColors.whiteColor)),
                const SizedBox(
                  height: 25,
                ),
                const Text('Please enter the gift code below',
                    style:
                        TextStyle(fontSize: 14, color: AppColors.whiteColor)),
                SizedBox(
                  height: height * 0.02,
                ),
                Center(
                  child: CustomTextField(
                    controller: giftCodeCon,
                    fillColor: AppColors.whiteColor,
                    textColor: AppColors.blackColor,
                    hintText: 'Please enter gift code',
                    maxLength: 15,
                    keyboardType: TextInputType.number,
                    fieldRadius: BorderRadius.circular(50),
                    margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Center(
                  child: AppBtn(
                    title: 'Receive',
                    titleColor: Colors.white,
                    onTap: () async {
                      UserViewModel userViewModal = UserViewModel();
                      String? userId = await userViewModal.getUser();
                      if (userId != null) {
                        if (giftCodeCon.text.isEmpty) {
                          Utils.flushBarErrorMessage(
                              'Enter a valid Gift code!', context);
                        } else {
                          // redeem gift api
                          redeemGiftViewModel.redeemGiftApi(
                              giftCodeCon.text, context);
                        }
                      } else {
                        Navigator.pushNamed(context, RoutesName.login);
                      }
                    },
                  ),
                )
              ],
            )),
        const SizedBox(
          height: 8,
        ),
        Container(
          height: height * 0.4,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: AppColors.appBarGradient),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(Assets.iconsTeamPort))),
                  ),
                  const Text('History',
                      style: TextStyle(
                          fontSize: 18,
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w700)),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              if (redeemGiftHisViewModel.redeemGiftHisModel != null)
                Expanded(
                  child: ListView.builder(
                      itemCount: redeemGiftHisViewModel
                          .redeemGiftHisModel!.data!.length,
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemBuilder: (context, index) {
                        final res = redeemGiftHisViewModel
                            .redeemGiftHisModel!.data![index];
                        return Column(
                          children: [
                            Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Successfully received',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.green,
                                            fontWeight: FontWeight.w500)),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(DateFormat.yMMMd().format(DateTime.parse(res.createdAt.toString())),
                                        style: const TextStyle(
                                            fontSize: 14,
                                            color: AppColors.whiteColor,
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),
                                const Spacer(),
                                Container(
                                  height: height * 0.03,
                                  width: width * 0.24,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                        color: AppColors.whiteColor,
                                      )),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.asset(Assets.iconsDepWallet),
                                        Text('Rs ${res.amount}',
                                            style: const TextStyle(
                                                fontSize: 14,
                                                color: AppColors.whiteColor,
                                                fontWeight: FontWeight.w500)),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            if(redeemGiftHisViewModel.redeemGiftHisModel!.data!.length-1!=index)
                            const Divider(
                              thickness: 1,
                              color: Colors.grey,
                            ),
                          ],
                        );
                      }),
                )
              else
                Container(
                    height: height * 0.3,
                    alignment: Alignment.center,
                    child: const Text(
                      'No data available!',
                      style:
                          TextStyle(fontSize: 16, color: AppColors.whiteColor),
                    ))
            ],
          ),
        )
      ],
    );
  }
}
