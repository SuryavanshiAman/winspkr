import 'package:flutter/material.dart';
import 'package:wins_pkr/constants/gradient_app_bar.dart';
import 'package:wins_pkr/constants/app_colors.dart';
import 'package:wins_pkr/res/no_data_found.dart';
import 'package:wins_pkr/constants/custom_text_field.dart';
import 'package:wins_pkr/constants/text_widget.dart';
import 'package:wins_pkr/generated/assets.dart';
import 'package:wins_pkr/main.dart';


class RecordPage extends StatefulWidget {
  const RecordPage({super.key});

  @override
  State<RecordPage> createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  GradientAppBar(
        elevation: 10,
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios,size: 15,color: AppColors.whiteColor,)
        ),
        centerTitle: true,
        title: const TextWidget(
          title: 'Record',
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: AppColors.whiteColor
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.imagesAppBg),
            fit: BoxFit.fill,
          ),
        ),
        child: ListView(
          children: [
            SizedBox(
              height: height * 0.04,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomTextField(
                  widths: width * 0.45,
                  borderSide: const BorderSide(
                    width: 1,
                    color: AppColors.whiteColor,
                  ),
                  prefixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.calendar_month,
                        color: AppColors.lightMarron,
                      )),
                ),
                const TextWidget(
                  title: 'to',
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: AppColors.whiteColor
                ),
                CustomTextField(
                  widths: width * 0.45,
                  prefixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.calendar_month,
                        color: AppColors.lightMarron,
                      )),
                  borderSide: const BorderSide(
                    width: 1,
                    color: AppColors.whiteColor,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.06,
            ),
            const Center(child: NoDataFoundPage())
          ],
        ),
      ),
    );
  }
}
