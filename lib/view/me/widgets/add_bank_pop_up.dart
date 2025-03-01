import 'package:flutter/material.dart';
import 'package:wins_pkr/constants/app_button.dart';
import 'package:wins_pkr/constants/app_colors.dart';
import 'package:wins_pkr/constants/custom_text_field.dart';
import 'package:wins_pkr/constants/text_widget.dart';
import 'package:wins_pkr/main.dart';
import 'package:wins_pkr/utils/utils.dart';
import 'package:wins_pkr/view_modal/bank_view_model.dart';
import 'package:provider/provider.dart';

class AddBankPopUp extends StatefulWidget {
  const AddBankPopUp({super.key});

  @override
  State<AddBankPopUp> createState() => _AddBankPopUpState();
}

class _AddBankPopUpState extends State<AddBankPopUp> {

  final TextEditingController name = TextEditingController();
  final TextEditingController accountNum = TextEditingController();
  final TextEditingController bankName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final addBankViewModel =
    Provider.of<BankViewModel>(context);
    return Container(
      height: height * 0.6,
      width: width,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        gradient: AppColors.appButton,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.04),
                const TextWidget(
                  title: "Holder Name",
                  fontSize: 18,
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: "openSansSerif",
                ),
                SizedBox(height: height * 0.005),
                CustomTextField(
                  widths: width * 0.7,
                  heights: height * 0.05,
                  controller: name,
                  fillColor: AppColors.lighterBlack,
                  hintText: "Enter the Holder Name",
                  hintColor: AppColors.whiteColor,
                ),
                SizedBox(height: height * 0.02),
                const TextWidget(
                  title: "Account Number",
                  fontSize: 18,
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: "openSansSerif",
                ),
                SizedBox(height: height * 0.005),
                CustomTextField(
                  widths: width * 0.7,
                  heights: height *0.05,
                  controller: accountNum,
                  keyboardType: TextInputType.number,
                  fillColor: AppColors.lighterBlack,
                  hintText: "Enter the Account Number",
                  hintColor: AppColors.whiteColor,
                ),
                SizedBox(height: height * 0.02),
                const TextWidget(
                  textAlign: TextAlign.start,
                  title: "Bank/Easypaisa/Jazzcash Name",
                  fontSize: 18,
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: "openSansSerif",
                ),
                SizedBox(height: height * 0.005),
                CustomTextField(
                  widths: width * 0.7,
                  heights: height *0.05,
                  controller: bankName,
                  fillColor: AppColors.lighterBlack,
                  hintText: "Enter Bank Name",
                  hintColor: AppColors.whiteColor,
                ),
                SizedBox(height: height * 0.03),
                AppBtn(
                  loading: addBankViewModel.loading,
                  onTap: () {
                    if (name.text.isEmpty){
                      Utils.flushBarErrorMessage("Enter Holder name", context,);
                    }else if(accountNum.text.isEmpty){
                      Utils.flushBarErrorMessage("Enter Account number", context, );
                    }else if(bankName.text.isEmpty){
                      Utils.flushBarErrorMessage("Enter Bank Name", context, );
                    }
                    else{
                      addBankViewModel.addBankApi(name.text,
                          accountNum.text, bankName.text, 'ifsc.text', context);
                    }
                  },
                  height: height * 0.05,
                  width: width * 0.7,
                  title: 'Confirm',
                  titleColor: AppColors.whiteColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  gradient: AppColors.appBarGradient,
                ),
              ],
            ),
          ),
          Positioned(
            top: -25,
            right: -25,
            child: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: AppColors.appBarGradient2,
                ),
                child:  const Icon(
                  Icons.cancel_outlined,
                  size: 25,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
