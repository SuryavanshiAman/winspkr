import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wins_pkr/constants/app_button.dart';
import 'package:wins_pkr/constants/app_colors.dart';
import 'package:wins_pkr/constants/custom_text_field.dart';
import 'package:wins_pkr/constants/gradient_app_bar.dart';
import 'package:wins_pkr/constants/text_widget.dart';
import 'package:wins_pkr/generated/assets.dart';
import 'package:wins_pkr/main.dart';
import 'package:wins_pkr/res/constant_wallet.dart';
import 'package:wins_pkr/utils/routes/routers_name.dart';
import 'package:wins_pkr/utils/utils.dart';
import 'package:wins_pkr/view_modal/bank_view_model.dart';
import 'package:wins_pkr/view_modal/paymode_view_model.dart';
import 'package:wins_pkr/view_modal/profile_view_model.dart';
import 'package:wins_pkr/view_modal/usdt_withdraw_view_model.dart';
import 'package:wins_pkr/view_modal/user_view_modal.dart';
import 'package:wins_pkr/view_modal/withdraw_view_modal.dart';
import 'package:provider/provider.dart';

class Withdraw extends StatefulWidget {
  const Withdraw({super.key});

  @override
  State<Withdraw> createState() => _WithdrawState();
}

class _WithdrawState extends State<Withdraw> {
  TextEditingController usdtCon = TextEditingController();
  TextEditingController usdtRupeeCon = TextEditingController();
  TextEditingController usdtAddress = TextEditingController();
  @override
  void initState() {
    super.initState();
    checkLogin();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<PaymodeViewModel>(context, listen: false).payModeApi(context);
    });
    usdtCon.addListener(() {
      final input = double.tryParse(usdtCon.text) ?? 0;
      usdtRupeeCon.text = (Provider.of<ProfileViewModel>(context, listen: false)
                  .profileData!
                  .usdtPayinAmount *
              input)
          .toStringAsFixed(2);
    });
  }

  int selectedCard = 0;

  void checkLogin() async {
    UserViewModel userViewModal = UserViewModel();
    String? userId = await userViewModal.getUser();
    if (userId != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final bankViewModel =
            Provider.of<BankViewModel>(context, listen: false);
        bankViewModel.accountViewApi(context);
      });
    } else {
      if (kDebugMode) {
        print('User Not login!');
      }
    }
  }

  int selectUsdt = 0;
  @override
  Widget build(BuildContext context) {

    final bankViewModel = Provider.of<BankViewModel>(context);
    final usdtViewModel = Provider.of<UsdtWithdrawViewModel>(context);
    final paymodeViewModel =
        Provider.of<PaymodeViewModel>(context).paymodeData?.data;
    final profileViewModel = Provider.of<ProfileViewModel>(context);
    return Consumer<WithdrawViewModel>(builder: (context, wwm, child) {
      return Scaffold(
        appBar: const GradientAppBar(
          leading: AppBackBtn(),
          centerTitle: true,
          title: Text(
            'Withdrawal',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: AppColors.whiteColor),
          ),
        ),
        body: Container(
          height: height,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.imagesAppBg), fit: BoxFit.fill),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
            child: ListView(
              shrinkWrap: true,
              children: [
                const SizedBox(height: 20),
                Container(
                  // height: height * 0.17,
                  width: width,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),

                      gradient : AppColors.appBarGradient
                    // image: const DecorationImage(
                    //     image: AssetImage(Assets.imagesCardImage),
                    //     fit: BoxFit.fill)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Image.asset(Assets.iconsWallet, height: 30),
                              const SizedBox(width: 15),
                              const Text(
                                'Winning Balance',
                                style: TextStyle(fontSize: 20, color: Colors.white),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const SizedBox(width: 15),
                              const Text( 'Rs ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 25,
                                  color: Colors.white,
                                ),
                              ),

                              Text(
                                profileViewModel.profileData?.data?.winningWallet ==
                                    null ? '0.00'
                                    : '${profileViewModel.profileData?.data?.winningWallet.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 25,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 15),
                              InkWell(
                                  onTap: () {
                                    Provider.of<ProfileViewModel>(context, listen: false).userProfileApi(context);
                                    //  context.read<ProfileProvider>().fetchProfileData();
                                    Utils.flushBarSuccessMessage(
                                      'Wallet refresh ✔',
                                      context,
                                    );
                                  },
                                  child: Image.asset(
                                    Assets.iconsTotalBal,
                                    height: 30,
                                  )),
                            ],
                          ),
                        ],
                      ),
                      Text("Your winning balance is here,You can withdraw only your winnings amount. Keep playing for bigger wins.", style:TextStyle(color: AppColors.whiteColor,
                        fontSize: 11,))
                    ],
                  ),
                ),
                // const ConstantWallet(),
                const SizedBox(height: 20),
                const Text(
                  'Payment Channel',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: AppColors.lightWhite,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: height * 0.12,
                  width: width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: paymodeViewModel?.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCard = index;
                          });
                        },
                        child: Card(
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: selectedCard == index
                                  ? AppColors.appButton
                                  : null,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: height * 0.15,
                            width: width * 0.25,
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  // color: Colors.red,
                                    height: height * 0.065,
                                    width: width * 0.15,
                                    child: paymodeViewModel != null
                                        ? Image.network(paymodeViewModel[index]
                                            .image
                                            .toString(),fit: BoxFit.fill,)
                                        : const TextWidget(
                                            title: '',
                                          )),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  paymodeViewModel != null
                                      ? paymodeViewModel[index].name.toString()
                                      : '',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w900,
                                    color: selectedCard == index
                                        ? AppColors.whiteColor
                                        : AppColors.blackColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                selectedCard == 1
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TextWidget(
                            textAlign: TextAlign.start,
                            title: "Add USDT Address",
                            fontSize: 14,
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          CustomTextField(
                            widths: width * 0.92,
                            controller: usdtAddress,
                            fillColor: AppColors.whiteColor,
                            maxLength: 10,
                            keyboardType: TextInputType.emailAddress,
                            hintText: "Enter USDT Address",
                            hintColor: Colors.black,
                            filled: true,
                            textColor: AppColors.blackColor,
                            prefixIcon: Image.asset(
                              Assets.iconsUsdtIcon,
                              scale: 3,
                            ),
                            cursorColor: AppColors.blackColor,
                            onChanged: (v) {
                              wwm.setGetWithdraw(double.parse(v));
                            },
                          ),
                          const TextWidget(
                            textAlign: TextAlign.start,
                            title:
                                "Need to add beneficiary information to be able to withdraw money",
                            fontSize: 10,
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                gradient: AppColors.appBarGradient),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        Assets.iconsUsdtIcon,
                                        scale: 3,
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      const Text(
                                        'Select Amount of USDT',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w900,
                                          color: AppColors.whiteColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height * 0.02,
                                  ),
                                  CustomTextField(
                                    widths: width,
                                    controller: usdtCon,
                                    filled: true,
                                    fillColor: AppColors.whiteColor,
                                    textColor: AppColors.blackColor,
                                    prefixIcon: Image.asset(
                                      Assets.iconsUsdtIcon,
                                      scale: 3,
                                    ),
                                    keyboardType: TextInputType.number,
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          usdtRupeeCon.clear();
                                          usdtCon.clear();
                                          selectUsdt = -1;
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.cancel_outlined,
                                        color: AppColors.blackColor,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.02,
                                  ),
                                  CustomTextField(
                                    widths: width,
                                    controller: usdtRupeeCon,
                                    filled: true,
                                    readOnly: true,
                                    fillColor: AppColors.whiteColor,
                                    textColor: AppColors.blackColor,
                                    prefixIcon: const Padding(
                                      padding: EdgeInsets.only(top: 8.0),
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        'Rs',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    keyboardType: TextInputType.number,
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          selectUsdt = -1;
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.cancel_outlined,
                                        color: AppColors.blackColor,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.02,
                                  ),
                                  AppBtn(
                                    loading: usdtViewModel.loadingOne,
                                    onTap: () async {
                                      usdtViewModel.usdtWithdrawApi(
                                          usdtAddress.text.toString(),
                                          usdtCon.text.toString(),
                                          usdtRupeeCon.text.toString(),
                                          context);
                                    },
                                    height: height * 0.05,
                                    width: width * 0.9,
                                    title: 'Submit',
                                    titleColor: AppColors.whiteColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    gradient: AppColors.appButton,
                                  ),
                                  SizedBox(
                                    height: height * 0.02,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          bankViewModel.bankDataModel != null &&
                                  bankViewModel.bankDataModel!.data!.isNotEmpty
                              ? Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 2),
                                  decoration: BoxDecoration(
                                    gradient: AppColors.appButton,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Theme(
                                    data: Theme.of(context).copyWith(
                                        dividerColor: Colors.transparent),
                                    child: ExpansionTile(
                                      title: const TextWidget(
                                        textAlign: TextAlign.start,
                                        title: "Account Details",
                                        fontSize: 15,
                                        color: AppColors.whiteColor,
                                      ),
                                      trailing: const Icon(
                                        Icons.arrow_drop_down,
                                        color: AppColors.whiteColor,
                                      ),
                                      children: List.generate(
                                          bankViewModel.bankDataModel!.data!
                                              .length, (index) {
                                        final accData = bankViewModel
                                            .bankDataModel!.data![index];
                                        return ListTile(
                                          leading: const Icon(
                                            Icons.account_balance_outlined,
                                            color: AppColors.whiteColor,
                                          ),
                                          title: TextWidget(
                                            textAlign: TextAlign.start,
                                            title: accData.bankName,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.whiteColor,
                                          ),
                                          subtitle: TextWidget(
                                            textAlign: TextAlign.start,
                                            title: accData.accountNum,
                                            fontSize: 13,
                                            color: AppColors.whiteColor,
                                          ),
                                          trailing: InkWell(
                                            onTap: () {
                                              wwm.setSelectedBank(index);
                                            },
                                            child: Container(
                                              height: height * 0.07,
                                              width: width * 0.07,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: Colors.white,
                                                  width: 2.0,
                                                ),
                                              ),
                                              child: wwm.selectedBank == index
                                                  ? const Center(
                                                      child: Icon(
                                                      Icons.check,
                                                      size: 15,
                                                      color:
                                                          AppColors.whiteColor,
                                                    ))
                                                  : null,
                                            ),
                                          ),
                                        );
                                      }),
                                    ),
                                  ),
                                )
                              : InkWell(
                                  onTap: () async {
                                    UserViewModel userViewModal =
                                        UserViewModel();
                                    String? userId =
                                        await userViewModal.getUser();
                                    if (userId != null) {
                                      Navigator.pushNamed(
                                          context, RoutesName.addBank);
                                    } else {
                                      Navigator.pushNamed(
                                          context, RoutesName.login);
                                    }
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        gradient: AppColors.appBarGradient),
                                    child: Container(
                                      width: width,
                                      padding: const EdgeInsets.fromLTRB(
                                          15, 15, 15, 15),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadiusDirectional.circular(
                                                  10)),
                                      child: Column(
                                        children: [
                                          const SizedBox(width: 15),
                                          Image.asset(
                                            Assets.iconsAddBank,
                                            height: 60,
                                          ),
                                          const SizedBox(width: 15),
                                          const Text(
                                            textAlign: TextAlign.center,
                                            'Add a bank/ Easypaisa/ jazzcash account number',
                                            style: TextStyle(
                                                color: AppColors.whiteColor,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w900),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                          const SizedBox(
                            height: 10,
                          ),
                          const TextWidget(
                            textAlign: TextAlign.start,
                            title:
                                "Need to add beneficiary information to be able to withdraw money",
                            fontSize: 10,
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.bold,
                          ),
                          const SizedBox(height: 20),
                          CustomTextField(
                            widths: width * 0.92,
                            heights: 50,
                            controller: wwm.withdrawCon,
                            fillColor: AppColors.whiteColor,
                            keyboardType: TextInputType.number,
                            hintText: "Enter Withdrawal Amount",
                            hintColor: AppColors.blackColor,
                            textColor: AppColors.blackColor,
                            filled: true,
                            prefixIcon:Image.asset("assets/icons/rs.png",scale: 4.5,),
                                // const Icon(Icons.currency_rupee_outlined),
                            cursorColor: AppColors.blackColor,
                            onChanged: (v) {
                              wwm.setGetWithdraw(double.parse(v));
                            },
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const TextWidget(
                                title: "Withdrawal Amount",
                                fontSize: 14,
                                color: AppColors.whiteColor,
                              ),
                              TextWidget(
                                title:
                                    "Rs ${wwm.withdrawCon.text.isEmpty ? '0.00' : wwm.withdrawCon.text}",
                                fontSize: 14,
                                color: AppColors.whiteColor,
                              ),
                            ],
                          ),

                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     const TextWidget(
                          //       title: "Inconvenience Fee",
                          //       fontSize: 14,
                          //       color: AppColors.whiteColor,
                          //     ),
                          //     TextWidget(
                          //       title:
                          //           "Rs ${wwm.inconvenienceFee.toStringAsFixed(2)}",
                          //       fontSize: 14,
                          //       color: AppColors.whiteColor,
                          //     ),
                          //   ],
                          // ),
                          const SizedBox(height: 20),
                          AppBtn(
                            loading: wwm.loading,
                            onTap: () async {
                              UserViewModel userViewModal = UserViewModel();
                              String? userId = await userViewModal.getUser();
                              if (userId != null) {
                                if (bankViewModel.bankDataModel != null &&
                                    bankViewModel
                                        .bankDataModel!.data!.isEmpty) {
                                  Utils.flushBarErrorMessage(
                                    "Add bank account/ Easypaisa/ jazzcash",
                                    context,
                                  );
                                } else if (wwm.withdrawCon.text.isEmpty) {
                                  Utils.flushBarErrorMessage(
                                    "Enter withdrawal amount",
                                    context,
                                  );
                                } else if (profileViewModel
                                        .profileData!.data!.winningWallet < (double.parse(wwm.withdrawCon.text) + wwm.inconvenienceFee)) {
                                  Utils.flushBarErrorMessage(
                                    "Insufficient withdrawal amount",
                                    context,
                                  );
                                } else {
                                  wwm.withdrawApi(
                                      wwm.withdrawCon.text,
                                      bankViewModel.bankDataModel!
                                          .data![wwm.selectedBank].id,
                                      "1",
                                      context);
                                }
                              } else {
                                Navigator.pushNamed(context, RoutesName.login);
                              }
                            },
                            height: height * 0.05,
                            width: width * 0.9,
                            title: 'Submit',
                            titleColor: AppColors.whiteColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            gradient: AppColors.appButton,
                          ),
                        ],
                      ),
                Padding(
                  padding: EdgeInsets.only(
                      left: width * 0.05,
                      right: width * 0.05,
                      bottom: height * 0.05,
                      top: height * 0.02),
                  child: const TextWidget(
                    textAlign: TextAlign.start,
                    title:
                        'Note: 3% of the withdrawal amount will be deducted as bank commission Please double check the withdrawal information, if withdrawal failed or you have any other questions, please contact CS 24/7',
                    color: AppColors.whiteColor,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
