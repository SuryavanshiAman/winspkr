import 'package:flutter/material.dart';
import 'package:wins_pkr/constants/app_button.dart';
import 'package:wins_pkr/constants/app_colors.dart';
import 'package:wins_pkr/constants/custom_text_field.dart';
import 'package:wins_pkr/constants/text_widget.dart';
import 'package:wins_pkr/main.dart';
import 'package:wins_pkr/utils/routes/routers_name.dart';

class AddCryptoPage extends StatefulWidget {
  const AddCryptoPage({super.key});

  @override
  State<AddCryptoPage> createState() => _AddCryptoPageState();
}

final TextEditingController name = TextEditingController();
final TextEditingController holderName = TextEditingController();
final TextEditingController cardNum = TextEditingController();

class _AddCryptoPageState extends State<AddCryptoPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: height * 0.55,
          decoration: BoxDecoration(
            gradient: AppColors.appBarGradient2,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: width * 0.035),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.05), // For spacing from the top
                const TextWidget(
                  title: "Crypto",
                  fontSize: 18,
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: "openSansSerif",
                ),
                SizedBox(height: height * 0.01),
                CustomTextField(
                  widths: width * 0.7,
                  heights: height * 0.07,
                  controller: name,
                  fillColor: AppColors.lighterBlack,
                  hintText: "Enter the crypto",
                  hintColor: AppColors.whiteColor,
                ),
                SizedBox(height: height * 0.02),
                const TextWidget(
                  title: "Holder Name",
                  fontSize: 18,
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: "openSansSerif",
                ),
                SizedBox(height: height * 0.01),
                CustomTextField(
                  widths: width * 0.7,
                  heights: height * 0.07,
                  controller: holderName,
                  fillColor: AppColors.lighterBlack,
                  hintText: "Enter the Holder Name",
                  hintColor: AppColors.whiteColor,
                ),
                SizedBox(height: height * 0.02),
                const TextWidget(
                  title: "Crypto Card Number",
                  fontSize: 18,
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: "openSansSerif",
                ),
                SizedBox(height: height * 0.01),
                CustomTextField(
                  widths: width * 0.7,
                  heights: height * 0.07,
                  controller: cardNum,
                  fillColor: AppColors.lighterBlack,
                  hintText: "Enter the Crypto Card Number",
                  hintColor: AppColors.whiteColor,
                ),
                SizedBox(height: height * 0.02),
                AppBtn(
                 onTap: (){
                   Navigator.pushNamed(context, RoutesName.addBank);
                 },
                  height: height * 0.06,
                  width: width * 0.7,
                  title: 'Confirm',
                  titleColor: AppColors.whiteColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  gradient: AppColors.appButton,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: -20,
          right: -20,
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.cancel_outlined,
              size: 30,
              color: AppColors.whiteColor,
            ),
          ),
        ),
      ],
    );
  }
}
