import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wins_pkr/constants/app_colors.dart';
import 'package:wins_pkr/res/no_data_found.dart';
import 'package:wins_pkr/constants/text_widget.dart';
import 'package:wins_pkr/generated/assets.dart';
import 'package:wins_pkr/main.dart';

class HistoryWidget extends StatelessWidget {
  const HistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
          margin: const EdgeInsets.all(15),
          height: height*0.2,
          width: width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.imagesEarnmoneyhistory),
              fit: BoxFit.fill,
            ),
          ),
          child:  const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextWidget(
                title: 'Total Rebates',
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: AppColors.marronBlack
              ),
              TextWidget(
               title:  'Rs 0',
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: AppColors.orange
              ),
            ],
          ),
        ),
        const NoDataFoundPage(),
      ],
    );
  }
}
