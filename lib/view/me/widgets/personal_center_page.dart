import 'package:flutter/material.dart';
import 'package:wins_pkr/constants/gradient_app_bar.dart';
import 'package:wins_pkr/constants/app_button.dart';
import 'package:wins_pkr/constants/app_colors.dart';
import 'package:wins_pkr/constants/custom_text_field.dart';
import 'package:wins_pkr/constants/text_widget.dart';
import 'package:wins_pkr/generated/assets.dart';
import 'package:wins_pkr/main.dart';
import 'package:wins_pkr/res/app_const.dart';
import 'package:wins_pkr/res/launcher.dart';
import 'package:wins_pkr/view/me/widgets/change_password.dart';
import 'package:wins_pkr/view/wingo/res/size_const.dart';
import 'package:provider/provider.dart';
import 'package:wins_pkr/view_modal/profile_view_model.dart';

class PersonalCenter extends StatefulWidget {
  const PersonalCenter({super.key});

  @override
  State<PersonalCenter> createState() => _PersonalCenterState();
}

class _PersonalCenterState extends State<PersonalCenter> {
  final TextEditingController name = TextEditingController();
  final TextEditingController phone = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameCon(context);
  }

  void nameCon(context) {
    final userProfileViewModel =
        Provider.of<ProfileViewModel>(context, listen: false).profileData;
    name.text = userProfileViewModel?.data?.name ?? "";
    phone.text = userProfileViewModel?.data?.mobile ?? "";
  }

  @override
  Widget build(BuildContext context) {
    final userProfileViewModel =
        Provider.of<ProfileViewModel>(context).profileData;
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
              size: 15,
              color: AppColors.whiteColor,
            )),
        title: const TextWidget(
          title: "Personal Center",
          fontSize: 15,
          fontWeight: FontWeight.w600,
          fontFamily: "openSansSerif",
          color: AppColors.whiteColor,
        ),
      ),
      body: userProfileViewModel != null
          ? Container(
              height: height,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Assets.imagesAppBg), fit: BoxFit.fill),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Container(
                      height: height * 0.15,
                      width: width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: AppColors.appButton,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Center(
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          left: 15, top: height * 0.01),
                                      height: height * 0.07,
                                      width: height * 0.07,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColors.whiteColor,
                                          gradient: AppColors.appBarGradient2,
                                          border: Border.all(
                                              width: 1,
                                              color: AppColors.lightMarron)),
                                    ),
                                  ),
                                  Positioned(
                                    top: height * 0.035,
                                    right: -width * 0.05,
                                    child: Center(
                                      child: Container(
                                        height: height * 0.08,
                                        width: width * 0.25,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  Assets.vipVipLevel),
                                              fit: BoxFit.fill),
                                        ),
                                        child: Center(
                                            child: Padding(
                                          padding: EdgeInsets.only(
                                              bottom: height * 0.015,
                                              left: width * 0.035),
                                          child: const TextWidget(
                                              title: 'VIP',
                                              fontSize: 10,
                                              fontWeight: FontWeight.w800,
                                              color: AppColors.marronBlack),
                                        )),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              SizedBox(
                                width: width * 0.25,
                                child: TextWidget(
                                    title: userProfileViewModel.data!.name
                                        .toString(),
                                    textAlign: TextAlign.center,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w800,
                                    color: AppColors.whiteColor),
                              ),
                            ],
                          ),
                          Container(
                            width: width * 0.6,
                            margin: EdgeInsets.only(right: width * 0.05),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [

                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextWidget(
                                        title: userProfileViewModel.data!.uId
                                            .toString(),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800,
                                        color: AppColors.whiteColor),
                                    InkWell(
                                        onTap: (){
                                          Launcher.copyToClipboard( userProfileViewModel.data!.uId
                                              .toString(), context);
                                        },
                                        child: Icon(Icons.file_copy_outlined,color: AppColors.whiteColor,))
                                  ],
                                ),
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextWidget(
                                        title: 'VIP',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800,
                                        color: AppColors.whiteColor),
                                    TextWidget(
                                        title: '0.00 / 5000.00',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w200,
                                        color: AppColors.whiteColor),
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: height * 0.01),
                                  width: width * 0.6,
                                  height: height * 0.02,
                                  decoration: BoxDecoration(
                                      color: AppColors.whiteColor,
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                const TextWidget(
                                    title: 'Deposit Monthly To Win Gifts',
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.whiteColor),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    const TextWidget(
                      title: "Full Name",
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: "openSansSerif",
                      color: AppColors.whiteColor,
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    CustomTextField(
                      widths: width * 0.9,
                      controller: name,
                      fillColor: AppColors.lighterBlack,
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    const TextWidget(
                      title: "Phone",
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: "openSansSerif",
                      color: AppColors.whiteColor,
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    CustomTextField(
                      widths: width * 0.9,
                      controller: phone,
                      fillColor: AppColors.lighterBlack,
                      maxLength: 10,
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const Dialog(child: ChangePassword());
                              },
                            );
                          },
                          child: const TextWidget(
                            title: 'Change Password',
                            fontSize: 14,
                            color: AppColors.whiteColor,
                          ),
                        ),
                        // AppBtn(
                        //   onTap: () {},
                        //   width: width * 0.25,
                        //   child: const Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //     children: [
                        //       Icon(
                        //         Icons.refresh,
                        //         color: AppColors.lightMarron,
                        //       ),
                        //       TextWidget(
                        //         title: 'Update',
                        //         fontSize: 12,
                        //         fontWeight: FontWeight.w800,
                        //         color: AppColors.lightMarron,
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    AppBtn(
                      onTap: () {},
                      height: height * 0.055,
                      width: width * 0.92,
                      title: "SIGN OUT",
                      fontSize: 15,
                      titleColor: AppColors.whiteColor,
                      fontWeight: FontWeight.bold,
                      border: Border.all(
                          color: AppColors.whiteColor.withOpacity(0.3)),
                    ),Sizes.spaceHeight20,
                    const TextWidget(
                      title: 'Version: ${AppConstants.appVersion}',
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      color: AppColors.whiteColor,
                    ),
                  ],
                ),
              ),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
