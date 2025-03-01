import 'package:flutter/material.dart';
import 'package:wins_pkr/constants/app_colors.dart';
import 'package:wins_pkr/main.dart';
import 'package:wins_pkr/view/vip/widget/vip_history.dart';
import 'package:wins_pkr/view/vip/widget/vip_rules.dart';


class VipTab extends StatefulWidget {
  const VipTab({super.key});

  @override
  State<VipTab> createState() => _VipTabState();
}

class _VipTabState extends State<VipTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: height * 0.07,
          width: width*0.93,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: AppColors.boxGradient),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildInkWell(21, 'History'),
              buildInkWell(22, 'Rules'),
            ],
          ),
        ),
        const SizedBox(height: 10),
        selectedIndex == 21 ? const VipHistory() : const VipRules(),
      ],
    );
  }

  int selectedIndex = 21;
  buildInkWell(int index, String title) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        height: height * 0.07,
        width: width/2.16,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: index == selectedIndex
                ? AppColors.loginSecondaryGrad:null
        ),
        child: Text(
          title,
          style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color:  AppColors.whiteColor),
        ),
      ),
    );
  }
}
