import 'package:flutter/material.dart';
import 'package:wins_pkr/utils/utils.dart';
import 'package:wins_pkr/view/wingo/res/size_const.dart';

import 'package:provider/provider.dart';
import 'package:wins_pkr/generated/assets.dart';
import 'package:wins_pkr/main.dart';
import 'package:wins_pkr/view/mines/controller/mine_controller.dart';
import 'package:wins_pkr/view/mines/view_model/mine_drop_down_view_model.dart';
import 'package:wins_pkr/view/mines/widget/mines_drawer.dart';
import 'package:wins_pkr/view/mines/res/mine_color.dart';
import 'package:wins_pkr/view/mines/view_model/mine_bet_view_model.dart';
import 'package:wins_pkr/view/mines/view_model/mine_cash_out_view_model.dart';
import 'package:wins_pkr/view/mines/widget/select_bet_amount.dart';
import 'package:wins_pkr/view/mines/widget/show_mine_pop_up.dart';
import 'package:wins_pkr/view_modal/profile_view_model.dart';

class Mines extends StatefulWidget {
  const Mines({super.key});

  @override
  State<Mines> createState() => _MinesState();
}

class _MinesState extends State<Mines> {
  @override
  void initState() {
    super.initState();
    final mic = Provider.of<MineController>(context, listen: false);
    mic.setSelectedBet(0);
    mic.setSelectedMine(3);
    mic.amountCon.text = mic.betAmountList[mic.selectedBet].toString();
    final mineDropDownViewModel =
        Provider.of<MineDropDownViewModel>(context, listen: false);
    mineDropDownViewModel.mineMultiplierApi(context);
    mic.setCashOut(false);
    mic.initializeGrid();
  }

  @override
  Widget build(BuildContext context) {
    final mineBetViewModel = Provider.of<MineBetViewModel>(context);
    final profileViewModel = Provider.of<ProfileViewModel>(context);
    final mineCashOutViewModel = Provider.of<MineCashOutViewModel>(context);
    final mineDropDownViewModel = Provider.of<MineDropDownViewModel>(context);
    return Consumer<MineController>(builder: (context, mic, child) {
      return Scaffold(
        bottomSheet: Container(
          height: height * 0.23,
          width: width,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20)),
              gradient: MineColor.containerGradient),
          child: Column(
            children: [
              SizedBox(
                height: height * 0.02,
              ),
              SizedBox(
                width: width * 0.8,
                height: height * 0.08,
                child: Stack(
                  children: [
                    Container(
                      width: width * 0.8,
                      height: height * 0.08,
                      decoration: BoxDecoration(
                          color: const Color(0xFF0267a5),
                          // Colors.greenAccent,
                          borderRadius: BorderRadius.circular(35)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                  height: height * 0.04,
                                  width: width * 0.3,
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 0, 15, 0),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        blurRadius: 5,
                                        spreadRadius: 2,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                    color: const Color(0xFF015759),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        width: 1, color: Colors.black),
                                  ),
                                  child: Row(
                                    children: [
                                      const Text(
                                        "Rs",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Sizes.spaceWidth15,
                                      const Text(
                                        'Bet',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12),
                                      ),
                                      Sizes.spaceWidth10,
                                      Text(
                                        mic.amountCon.text,
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  )),

                              // )
                            ],
                          ),
                          const SizedBox(),
                          InkWell(
                            onTap: () {
                              mic.decrementCounter();
                            },
                            child: Container(
                                margin: EdgeInsets.zero,
                                alignment: Alignment.center,
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                    color: Colors.teal,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        blurRadius: 5,
                                        spreadRadius: 2,
                                        offset: const Offset(0,
                                            3), // Adjust the shadow's position here
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Colors.black)),
                                child: const Icon(
                                  Icons.remove,
                                  size: 20,
                                  color: Colors.white,
                                )),
                          ),
                          InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) =>
                                      const SelectBetAmount());
                            },
                            child: Container(
                                margin: EdgeInsets.zero,
                                alignment: Alignment.center,
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                    color: Colors.teal,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        blurRadius: 5,
                                        spreadRadius: 2,
                                        offset: const Offset(0,
                                            3), // Adjust the shadow's position here
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Colors.black)),
                                child: Image.asset(
                                  Assets.minesStack,
                                  height: 20,
                                )),
                          ),
                          InkWell(
                            onTap: () {
                              mic.incrementCounter();
                            },
                            child: Container(
                                margin: EdgeInsets.zero,
                                alignment: Alignment.center,
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                    color: Colors.teal,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        blurRadius: 5,
                                        spreadRadius: 2,
                                        offset: const Offset(0,
                                            3), // Adjust the shadow's position here
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Colors.black)),
                                child: const Text(
                                  '+',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                )),
                          ),
                        ],
                      ),
                    ),
                    if (mic.cashOut == true)
                      Container(
                        width: width * 0.8,
                        height: height * 0.08,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            // Colors.greenAccent,
                            borderRadius: BorderRadius.circular(35)),
                      ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              mic.cashOut == false
                  ? InkWell(
                      onTap: () {
                        if(profileViewModel.profileData!.data!.wallet <int.parse(mic.amountCon.text)){
                          Utils.flushBarErrorMessage("Insufficient Balance", context);
                        }else{
                          mic.setCashOut(true);
                          mic.refreshGame();
                          mineBetViewModel.mineBetApi(mic.amountCon.text, context);
                        }
                      },
                      child: Container(
                        width: width * 0.8,
                        height: height * 0.07,
                        decoration: BoxDecoration(
                            gradient: MineColor.ssButton,
                            // Colors.greenAccent,
                            borderRadius: BorderRadius.circular(35)),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.play_arrow_outlined,
                                size: 35,
                                color: Colors.white,
                              ),
                              Text(
                                'Play',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : InkWell(
                      onTap: () {
                        mic.setCashOut(false);
                        mineCashOutViewModel.mineCashOutApi(
                            mic.amountValue.toStringAsFixed(2),
                            mineDropDownViewModel.mineDropDownModel != null
                                ? mineDropDownViewModel.mineDropDownModel!.data!
                                    .firstWhere((e) => e.id == mic.selectedMine)
                                    .multiplier
                                : '',
                            1,
                            context);
                      },
                      child: Container(
                        width: width * 0.8,
                        height: height * 0.07,
                        decoration: BoxDecoration(
                            gradient: MineColor.checkOutBtnGradient,
                            borderRadius: BorderRadius.circular(35)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(
                                Icons.pause,
                                size: 35,
                                color: Colors.white,
                              ),
                              Text(
                                'Cash Out:${mic.amountValue.toStringAsFixed(2)} RS',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
        body: Container(
          height: height,
          width: width,
          decoration: const BoxDecoration(gradient: MineColor.minesBgGradient),
          child: SafeArea(
            child: ListView(
              padding: const EdgeInsets.all(10),
              children: [
                Container(
                  height: height * 0.07,
                  width: width * 0.9,
                  padding: const EdgeInsets.fromLTRB(15, 8, 10, 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: MineColor.containerGradient,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.arrow_back_ios,
                            color: MineColor.whiteColor,
                          )),
                      const Text(
                        '       MINES',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: Colors.white),
                      ),
                      Row(
                        children: [
                          Text(
                            profileViewModel.profileData!.data!.wallet
                                    .toStringAsFixed(2) +
                                ' RS',
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w900,
                                color: Colors.white),
                          ),
                          InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return const MinesDrawer();
                                },
                              );
                            },
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  color: Colors.teal,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      blurRadius: 5,
                                      spreadRadius: 2,
                                      offset: const Offset(0,
                                          3), // Adjust the shadow's position here
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.black)),
                              child: const Icon(
                                Icons.menu,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: height * 0.04,
                  width: width,
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    gradient: MineColor.containerGradient,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: width * 0.35,
                        decoration: BoxDecoration(
                          color: const Color(0xFF015759),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(width: 1, color: Colors.black),
                        ),
                        child: mineDropDownViewModel.mineDropDownModel != null
                            ? DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  menuMaxHeight: height * 0.5,
                                  borderRadius: BorderRadius.circular(5),
                                  value: mic.selectedMine,
                                  onChanged: (val) {
                                    mic.setSelectedMine(val!);
                                  },
                                  isExpanded: true,
                                  iconSize: 24,
                                  icon: const Icon(Icons.arrow_drop_down),
                                  iconEnabledColor: Colors.white,
                                  dropdownColor: const Color(0xFF015759),
                                  alignment: Alignment.center,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  items: mineDropDownViewModel
                                      .mineDropDownModel!.data!
                                      .map((value) {
                                    return DropdownMenuItem(
                                      value: value.id,
                                      child: Center(
                                        child: Text(
                                          '${value.name}',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              )
                            : null,
                      ),
                      Container(
                          width: width * 0.3,
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          decoration: BoxDecoration(
                            color: mic.cashOut == true
                                ? Colors.green
                                : const Color(0xffffc107),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(width: 1, color: Colors.black),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Next:',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors
                                      .black, // This is for the dropdown button text
                                ),
                              ),
                              Text(
                                '${mineDropDownViewModel.mineDropDownModel != null ? mineDropDownViewModel.mineDropDownModel!.data!.firstWhere((e) => e.id == mic.selectedMine).multiplier : ''} x',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors
                                      .black, // This is for the dropdown button text
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: LinearProgressIndicator(
                    value: mic.selectedLength / (25 - mic.selectedMine),
                    backgroundColor: const Color(0xff013599),
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Colors.green),
                  ),
                ),
                const SizedBox(height: 10),
                Stack(
                  children: [
                    GridView.builder(
                      shrinkWrap: true,
                      itemCount: mic.rows * mic.columns,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: mic.columns,
                      ),
                      itemBuilder: (context, index) {
                        final row = index ~/ mic.columns;
                        final col = index % mic.columns;
                        return GestureDetector(
                          onTap: () {
                            if(profileViewModel.profileData!.data!.wallet <int.parse(mic.amountCon.text)){
                              Utils.flushBarErrorMessage("Insufficient Balance", context);
                            }else{
                              if (!mic.gameLost) {
                                mic.setIsTapped(true);
                                if (mic.grid[index ~/ mic.columns]
                                [index % mic.columns]) {
                                  mic.setGameLost(true);
                                  mic.setCashOut(false);
                                  mic.setAmountValue(0.0);
                                  mineCashOutViewModel.mineCashOutApi(
                                      mic.amountValue.toStringAsFixed(2),
                                      mineDropDownViewModel.mineDropDownModel !=
                                          null
                                          ? mineDropDownViewModel
                                          .mineDropDownModel!.data!
                                          .firstWhere(
                                              (e) => e.id == mic.selectedMine)
                                          .multiplier
                                          : '',
                                      2,
                                      context);
                                  showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return const ShowMinePopUp();
                                      });
                                } else {
                                  mic.updateSelectedCell(index, true);
                                }
                                mic.setSelectedLength(mic.selectedCells
                                    .where((cell) => cell)
                                    .length);
                                mic.setAmountValue(int.parse(mic.amountCon.text) +
                                    (mic.selectedLength *
                                        mineDropDownViewModel
                                            .mineDropDownModel!.data!
                                            .firstWhere(
                                                (e) => e.id == mic.selectedMine)
                                            .multiplier as double));
                              }
                            }

                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              image: DecorationImage(
                                  image: AssetImage(mic.selectedCells[index]
                                      ? Assets.minesVault
                                      : mic.isTapped &&
                                              mic.grid[row][col] &&
                                              mic.gameLost
                                          ? Assets.minesMine
                                          : Assets.minesMineGrid),
                                  fit: BoxFit.fill),
                            ),
                          ),
                        );
                      },
                    ),
                    if (mic.cashOut == false)
                      Container(
                        height: height * 0.55,
                        width: width,
                        color: Colors.transparent,
                      )
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
