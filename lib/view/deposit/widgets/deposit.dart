import 'package:flutter/material.dart';
import 'package:wins_pkr/constants/app_button.dart';
import 'package:wins_pkr/constants/app_colors.dart';
import 'package:wins_pkr/constants/custom_text_field.dart';
import 'package:wins_pkr/constants/gradient_app_bar.dart';
import 'package:wins_pkr/constants/text_widget.dart';
import 'package:wins_pkr/generated/assets.dart';
import 'package:wins_pkr/main.dart';
import 'package:wins_pkr/res/constant_wallet.dart';
import 'package:wins_pkr/view/new_pages_by_harsh/save_screen_shot.dart';
import 'package:wins_pkr/view_modal/deposit_view_modal.dart';
import 'package:wins_pkr/view_modal/paymode_view_model.dart';
import 'package:wins_pkr/view_modal/profile_view_model.dart';
import 'package:provider/provider.dart';

class Deposit extends StatefulWidget {
  const Deposit({super.key});

  @override
  State<Deposit> createState() => _DepositState();
}

class _DepositState extends State<Deposit> {
  int selectedCard = 0;
  int selectAmount = 0;
  int selectUsdt = 0;

  TextEditingController depositCon = TextEditingController();
  TextEditingController usdtCon = TextEditingController();
  TextEditingController usdtRupeeCon = TextEditingController();
  List<int> amountList = [ 300, 500, 1000, 2000, 3000, 5000, 10000, 20000,50000];
  List<String> rechargeInstruction = [
    'Minimum deposit: 10USDT , deposits less than 10USDT  will not be credited',
  ];
  List<int> usdtList = [
    10,
    50,
    100,
    200,
    500,
    1000,
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<PaymodeViewModel>(context, listen: false).payModeApi(context);
    });
    depositCon.text = amountList[selectAmount].toString();
    usdtCon.addListener(() {
      final input = double.tryParse(usdtCon.text) ?? 0;
      usdtRupeeCon.text = (Provider.of<ProfileViewModel>(context, listen: false)
                  .profileData!
                  .usdtPayinAmount *
              input)
          .toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    final depositViewModal = Provider.of<DepositViewModel>(context);
    final paymodeViewModel = Provider.of<PaymodeViewModel>(context).paymodeData?.data;
    // final usdtRupeeCont = Provider.of<ProfileViewModel>(context, listen: false)
    //     .profileData!
    //     .usdtPayinAmount
    //     .toString();

    return Scaffold(
      appBar: const GradientAppBar(
        leading: AppBackBtn(),
        centerTitle: true,
        title: Text(
          'Deposit',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: AppColors.whiteColor),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.imagesAppBg), fit: BoxFit.fill),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
          child: ListView(
            shrinkWrap: true,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const ConstantWallet(),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Payment Channel',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: AppColors.whiteColor,
                ),
              ),
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
                              SizedBox(
                                  height: height * 0.06,
                                  width: width * 0.15,
                                  child:paymodeViewModel!=null? Image.network(paymodeViewModel[index].image.toString(),fit: BoxFit.fill,):const TextWidget(title: '',)),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                  paymodeViewModel!=null? paymodeViewModel[index].name.toString():'',
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
              selectedCard == 0
                  ? Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          gradient: AppColors.appBarGradient,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                Assets.iconsDepWallet,
                                scale: 2,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const Text(
                                'Deposit Amount',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 9 / 4,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5,
                            ),
                            itemCount: amountList.length,
                            itemBuilder: (context, index) {
                              return Center(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectAmount = index;
                                      depositCon.text =
                                          amountList[index].toString();
                                    });
                                  },
                                  child: Container(
                                    height: height * 0.045,
                                    width: width * 0.25,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        gradient: selectAmount == index
                                            ? AppColors.appButton
                                            : null,
                                        border: Border.all(
                                          width: 1,
                                          color: selectAmount != index
                                              ? Colors.grey
                                              : Colors.transparent,
                                        )),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Rs ',
                                          style: TextStyle(
                                            fontSize: 18,
                                            wordSpacing: 1,
                                            color: selectAmount == index
                                                ? AppColors.whiteColor
                                                : AppColors.lightBlack,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                        Text(
                                          amountList[index].toString(),
                                          style: TextStyle(
                                            fontSize: 18,
                                            wordSpacing: 1,
                                            color: selectAmount == index
                                                ? AppColors.whiteColor
                                                : AppColors.lightBlack,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          CustomTextField(
                            widths: width,
                            controller: depositCon,
                            filled: true,
                            fillColor: AppColors.whiteColor,
                            textColor: AppColors.blackColor,
                            prefixIcon: const Padding(
                              padding: EdgeInsets.only(top: 8.0),
                              child: Text(
                                textAlign: TextAlign.center,
                                'Rs',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w700),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  depositCon.clear();
                                  selectAmount = -1;
                                });
                              },
                              icon: const Icon(
                                Icons.cancel_outlined,
                                color: AppColors.blackColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.03,
                          ),
                          AppBtn(
                            loading: depositViewModal.loading,
                            width: width,
                            onTap: () async {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SaveScreenShot(type:"1",
                                          amount: depositCon.text.toString())));
                            },
                            title: 'Submit',
                            titleColor: AppColors.whiteColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ],
                      ),
                    )
                  : selectedCard == 1
                      ? Container(
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
                                  height: height * 0.01,
                                ),
                                GridView.builder(
                                  shrinkWrap: true,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    childAspectRatio: 9 / 4,
                                    crossAxisSpacing: 5,
                                    mainAxisSpacing: 5,
                                  ),
                                  itemCount: usdtList.length,
                                  itemBuilder: (context, index) {
                                    final data = usdtList[index];
                                    return Center(
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            selectUsdt = index;
                                            usdtCon.text =
                                                usdtList[index].toString();
                                          });
                                        },
                                        child: Container(
                                          height: height * 0.045,
                                          width: width * 0.25,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              gradient: selectUsdt == index
                                                  ? AppColors.appButton
                                                  : null,
                                              border: Border.all(
                                                width: 1,
                                                color: selectUsdt != index
                                                    ? Colors.grey
                                                    : Colors.transparent,
                                              )),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                Assets.iconsUsdtIcon,
                                                scale: 3,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                data.toString(),
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  wordSpacing: 1,
                                                  color: selectUsdt == index
                                                      ? AppColors.whiteColor
                                                      : AppColors.lightBlack,
                                                  fontWeight: FontWeight.w900,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(
                                  height: height * 0.01,
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
                                CustomTextField(
                                  widths: width,
                                  controller: usdtRupeeCon,
                                  filled: true,
                                  readOnly: true,
                                  fillColor: AppColors.whiteColor,
                                  textColor: AppColors.blackColor,
                                  prefixIcon:const Padding(
                                    padding: EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      'Rs',
                                      style: TextStyle(
                                          fontSize: 20, fontWeight: FontWeight.w700),
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
                                  height: height * 0.03,
                                ),
                                AppBtn(
                                  loading: depositViewModal.loading,
                                  width: width,
                                  onTap: () async {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SaveScreenShot(type:"2",
                                                amount: usdtRupeeCon.text.toString()
                                            )));
                                  },
                                  title: 'Submit',
                                  titleColor: AppColors.whiteColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ],
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
              const SizedBox(height: 20),
              Container(
                width: width,
                padding: const EdgeInsets.only(
                    top: 15, left: 15, right: 15, bottom: 15),
                decoration: BoxDecoration(
                    gradient: AppColors.appBarGradient,
                    borderRadius: BorderRadiusDirectional.circular(10)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          Assets.iconsRecIns,
                          scale: 1.5,
                          color: AppColors.whiteColor,
                        ),
                        const SizedBox(width: 15),
                        const Text(
                          'Recharge instructions',
                          style: TextStyle(
                              fontSize: 20,
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          // color: Colors.white,
                          border: Border.all(color: AppColors.whiteColor),
                          borderRadius: BorderRadiusDirectional.circular(10)),
                      child: Column(
                        children: [
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: rechargeInstruction.length,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return instruction(rechargeInstruction[index]);
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget instruction(String title) {
    return ListTile(
      leading: Transform.rotate(
        angle: 45 * 3.1415927 / 180,
        child: Container(
          height: 10,
          width: 10,
          color: AppColors.lightMarron,
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 14, color: AppColors.whiteColor),
      ),
    );
  }
}
