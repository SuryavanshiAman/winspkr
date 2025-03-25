import 'package:flutter/material.dart';
import 'package:wins_pkr/constants/app_colors.dart';
import 'package:wins_pkr/constants/text_widget.dart';
import 'package:wins_pkr/generated/assets.dart';
import 'package:wins_pkr/main.dart';
import 'package:provider/provider.dart';
import 'package:wins_pkr/view/wingo/res/size_const.dart';
import 'package:wins_pkr/view/wingo/controller/win_go_controller.dart';
import 'package:wins_pkr/view/wingo/view_model/win_go_bet_view_model.dart';


class WinGoBottomSheet extends StatefulWidget {
  final dynamic data;

  const WinGoBottomSheet({super.key, required this.data});

  @override
  State<WinGoBottomSheet> createState() => _WinGoBottomSheetState();
}

class _WinGoBottomSheetState extends State<WinGoBottomSheet> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final result = Provider.of<WinGoController>(context,listen: false);
    result.finalAmount.text="1";
  }
  @override
  void dispose() {
    final result = Provider.of<WinGoController>(context,listen: false);
    result.finalAmount.clear();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final winGoBetViewModel = Provider.of<WinGoBetViewModel>(context);
    return Consumer<WinGoController>(builder: (context, wgc, child) {
      return SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: height * 0.55,
              width: width,
              decoration: const BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30), topLeft: Radius.circular(30))),
              child: Column(
                children: [
                  curvedDesign(context),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: width * 0.1, top: height * 0.02),
                        child: const TextWidget(
                          title: "Balance",
                          fontSize: 18,
                          color: AppColors.greyColor,
                        ),
                      ),
                      Sizes.spaceHeight10,
                      SizedBox(
                        width: width,
                        height: height * 0.05,
                        child: Center(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: wgc.balanceList.length,
                            itemBuilder: (context, idx) {
                              return InkWell(
                                onTap: () {
                                  wgc.setSelectedBIndex(idx);
                                  wgc.amount.text = wgc.balanceList[wgc.selectedIndexBalance].toString();
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(2),
                                  alignment: Alignment.center,
                                  width: width * 0.2,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    gradient:
                                        wgc.selectedIndexBalance ==
                                            idx
                                            ? LinearGradient(
                                                colors: [
                                                  widget
                                                      .data["col1"],
                                                  widget
                                                      .data["col2"],
                                                ],
                                              )
                                            : const LinearGradient(
                                                colors: [
                                                  AppColors.lightWhite,
                                                  AppColors.lightWhite
                                                ],
                                              ),
                                  ),
                                  child: Center(
                                    child: TextWidget(
                                        textAlign: TextAlign.center,
                                        title: wgc.balanceList[idx].toString(),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            wgc.selectedIndexBalance ==
                                                    idx
                                                ? AppColors.whiteColor
                                                : AppColors.blackColor),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Sizes.spaceHeight20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const TextWidget(
                          title: "Quantity", fontSize: 18, color: AppColors.greyColor),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                        InkWell(
                          onTap: () {
                            wgc.decrement();
                          },
                          child: Icon(
                            Icons.remove_circle,
                            color:
                                widget.data["col1"],
                            size: 30,
                          ),
                        ),
                        Container(
                            height: height*0.04,
                            alignment: Alignment.center,
                            width: width*0.2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                             color: AppColors.lightWhite,
                            ),
                            child:  TextField(
                              controller: wgc.finalAmount,
                              cursorHeight: height*0.02,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              decoration:  InputDecoration(
                                contentPadding: EdgeInsets.only(bottom: height*0.01),
                                  border: const OutlineInputBorder(),
                              ),
                              style: const TextStyle(fontSize: 17, color: AppColors.blackColor),
                            )
                        ),
                        InkWell(
                          onTap: () {
                            wgc.increment();
                          },
                          child: Icon(
                            Icons.add_circle,
                            color:
                            widget.data["col1"],
                            size: 30,
                          ),
                        ),
                      ]),
                    ],
                  ),
                  Sizes.spaceHeight20,
                  SizedBox(
                    height: height * 0.045,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: wgc.multiplierList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: InkWell(
                              onTap: () {
                                wgc.setSelectedIndexMultiplier(index);
                              },
                              child: Container(
                                width: width * 0.13,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  gradient: wgc.selectedIndexMultiplier ==
                                  index
                                  ? LinearGradient(
                                  colors: [
                                    widget
                                        .data["col1"],
                                    widget
                                        .data["col2"],
                                  ],
                                )
                                    : const LinearGradient(
                                colors: [
                                AppColors.lightWhite,
                                AppColors.lightWhite
                                ],
                              ),
                                ),
                                child: Center(
                                  child: TextWidget(
                                    title: "X${wgc.multiplierList[index]}",
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color:  wgc.selectedIndexMultiplier ==
                                        index
                                        ? AppColors.whiteColor
                                        : AppColors.blackColor,
                                  ),
                                ),
                              ),
                            ));
                      },
                    ),
                  ),
                  Sizes.spaceHeight20,
              Row(
                children: [
                  Sizes.spaceWidth25,
                  GestureDetector(
                    onTap: () {
                      wgc.setIsSelected(!wgc.isSelected);
                    },
                    child: Container(
                      height: 20,
                      width: 20,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white, // Color when selected
                        border: Border.all(
                          color: widget.data["col1"],
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: wgc.isSelected
                          ? const Icon(Icons.check, color: Colors.green, size: 15)
                          : null,
                    ),
                  ),
                  const TextWidget(
                    title: " I agree",
                    color: AppColors.blackColor,
                    fontSize: 15,
                  ),
                  Sizes.spaceWidth15,
                  InkWell(
                    onTap: () {},
                    child: const TextWidget(
                      title: "《Pre-sale rules》",
                      color: AppColors.lightBlack,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
                  const Spacer(),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          wgc.clear();
                          Navigator.pop(context);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.black.withOpacity(0.7),
                          width: width / 3,
                          height: 45,
                          child: const TextWidget(
                              title: "Cancel", color: Colors.white, fontSize: 20),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          winGoBetViewModel.wingoBet(widget.data["game_id"], wgc.finalAmount.text,wgc.gameIndex + 1, context);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                            colors: [
                              widget
                                  .data["col1"],
                              widget
                                  .data["col2"],
                            ],
                          )),
                          width: width / 1.5,
                          height: 45,
                          child: winGoBetViewModel.loading?Image.asset(Assets.winGoLoading): Text(
                            "Total amount : ${wgc.finalAmount.text}",
                            style: const TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }
    );
  }

  Widget curvedDesign(context) {
    final wingoGameController = Provider.of<WinGoController>(context);
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          height: height * 0.15,
          width: width,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(28), topLeft: Radius.circular(28)),
              gradient: LinearGradient(
                colors: [
                  widget
                      .data["col1"],
                  widget
                      .data["col2"],
                ],
                transform: const GradientRotation(1.20),
                stops: const [0.55, 0.3],
              )),
          alignment: Alignment.bottomLeft,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextWidget(
                    title: wingoGameController.gameTimerList[
                        wingoGameController.gameIndex].title,
                    color: AppColors.whiteColor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  Sizes.spaceWidth10,
                  TextWidget(
                    title: wingoGameController.gameTimerList[
                        wingoGameController.gameIndex].subTitle,
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const TextWidget(
                    title: "Select : ",
                    color: AppColors.whiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  Sizes.spaceWidth10,
                  TextWidget(
                    title: widget.data["title"].toString(),
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          bottom: -26,
          left: -20,
          child: Transform.rotate(
              angle: .34,
              child: Container(
                height: 60,
                width: width / 1.8,
                color: Colors.white,
              )),
        ),
        Positioned(
          bottom: -26,
          right: -20,
          child: Transform.rotate(
              angle: -.34,
              child: Container(
                height: 60,
                width: width / 1.8,
                color: Colors.white,
              )),
        ),
      ],
    );
  }
}
