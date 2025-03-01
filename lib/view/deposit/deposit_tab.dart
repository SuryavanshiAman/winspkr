import 'package:flutter/material.dart';
import 'package:wins_pkr/constants/app_colors.dart';
import 'package:wins_pkr/constants/constant_widgets/app_bar.dart';
import 'package:wins_pkr/constants/constant_widgets/container_constant.dart';
import 'package:wins_pkr/generated/assets.dart';
import 'package:wins_pkr/main.dart';
import 'package:wins_pkr/view/deposit/widgets/deposit.dart';
import 'package:wins_pkr/view/deposit/widgets/withdraw.dart';


class DepositTab extends StatefulWidget {
  final int? selectedIndex;
  const DepositTab({super.key, this.selectedIndex});

  @override
  State<DepositTab> createState() => _DepositTabState();
}

class _DepositTabState extends State<DepositTab> {
  int selectedIndex = 0;


  void selectContainer(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.selectedIndex ?? 0;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarPage(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
              AppColors.lighterMaroon,
              BlendMode.saturation, // Blend mode to desaturate
            ),
            image: AssetImage(Assets.imagesAppBg),
            fit: BoxFit.fill,
          ),
        ),
        child: ListView(
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          children: [
            SizedBox(
              height: height * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SelectableContainer(
                  height: height * 0.05,
                  width: width * 0.45,
                  name: 'Deposit',
                  isSelected: selectedIndex == 0,
                  onTap: () => selectContainer(0),
                ),
                SelectableContainer(
                  height: height * 0.05,
                  width: width * 0.45,
                  name: 'Withdrawal',
                  isSelected: selectedIndex == 1,
                  onTap: () => selectContainer(1),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.05,
            ),
            selectedIndex == 0
                ? const Deposit()
                : const Withdraw(),
          ],
        ),
      ),
    );
  }
}
