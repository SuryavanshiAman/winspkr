import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wins_pkr/constants/app_button.dart';
import 'package:wins_pkr/constants/app_colors.dart';
import 'package:wins_pkr/constants/text_widget.dart';
import 'package:wins_pkr/main.dart';
import 'package:wins_pkr/view/wingo/res/size_const.dart';
import 'package:wins_pkr/view/wingo/view_model/win_go_my_his_view_model.dart';

class WingoMyHis extends StatefulWidget {
  const WingoMyHis({super.key});

  @override
  State<WingoMyHis> createState() => _WingoMyHisState();
}

class _WingoMyHisState extends State<WingoMyHis> {
  int currentOffset = 0;
  int pageValue = 1;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      final winGoHisViewModel =
      Provider.of<WinGoMyHisViewModel>(context, listen: false);
      winGoHisViewModel.myBetHisApi(context,currentOffset);
    });
  }

  @override
  Widget build(BuildContext context) {
    final winGoHisViewModel =
        Provider.of<WinGoMyHisViewModel>(context);
    if (winGoHisViewModel.winGoMyHisModelData != null &&
        winGoHisViewModel.winGoMyHisModelData!.data!.isNotEmpty) {
      return Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: winGoHisViewModel.winGoMyHisModelData!.data!.length,
            itemBuilder: (context, index) {
              final betHistoryData =
                  winGoHisViewModel.winGoMyHisModelData!.data![index];
              final color = betHistoryData.number == 0
                  ? [Colors.red, Colors.purple]
                  : betHistoryData.number == 5
                      ? [Colors.green, Colors.purple]
                      : betHistoryData.number == 10
                          ? [Colors.green, Colors.green]
                          : betHistoryData.number == 20
                              ? [Colors.purple, Colors.purple]
                              : betHistoryData.number == 30
                                  ? [Colors.red, Colors.red]
                                  : betHistoryData.number == 40
                                      ? [Colors.orange, Colors.orange]
                                      : betHistoryData.number == 50
                                          ? [Colors.blue, Colors.blue]
                                          : (betHistoryData.number == 2 ||
                                                  betHistoryData.number == 4 ||
                                                  betHistoryData.number == 6 ||
                                                  betHistoryData.number == 8)
                                              ? [Colors.red, Colors.red]
                                              : [Colors.green, Colors.green];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    leading: Container(
                      alignment: Alignment.center,
                      height: height * 0.066,
                      width: width * 0.15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          colors: color,
                          stops: const [0.5, 0.5],
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                        ),
                      ),
                      child: TextWidget(
                        textAlign: TextAlign.center,
                        title: betHistoryData.number == 10
                            ? 'G'
                            : betHistoryData.number == 20
                                ? 'V'
                                : betHistoryData.number == 30
                                    ? 'R'
                                    : betHistoryData.number == 40
                                        ? 'B'
                                        : betHistoryData.number == 50
                                            ? 'S'
                                            : betHistoryData.number.toString(),
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    title: TextWidget(
                      textAlign: TextAlign.left,
                      title: betHistoryData.gamesNo.toString(),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppColors.whiteColor,
                    ),
                    subtitle: TextWidget(
                      textAlign: TextAlign.left,
                      title: betHistoryData.createdAt,
                      fontSize: 10,
                      color: AppColors.whiteColor,
                    ),
                    trailing: Column(
                      children: [
                        AppBtn(
                          height: height * 0.04,
                          width: width * 0.2,
                          title: betHistoryData.status == 0
                              ? "Pending"
                              : betHistoryData.status == 1
                                  ? "Success"
                                  : "Failed",
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          titleColor: betHistoryData.status == 0
                              ? Colors.orange
                              : betHistoryData.status == 1
                                  ? Colors.green
                                  : Colors.red,
                          fontSize: 12,
                          gradient: AppColors.transparentGradient,
                          border: Border.all(
                            color: betHistoryData.status == 0
                                ? Colors.orange
                                : betHistoryData.status == 1
                                    ? Colors.green
                                    : Colors.red,
                          ),
                        ),
                        Sizes.spaceHeight5,
                        TextWidget(
                          title: "Rs ${(betHistoryData.status == 1?betHistoryData.winAmount:betHistoryData.amount).toStringAsFixed(2)}",
                          fontSize: 12,
                          color: betHistoryData.status == 0
                              ? Colors.orange
                              : betHistoryData.status == 1
                                  ? Colors.green
                                  : Colors.red,
                        ),
                      ],
                    ),
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextWidget(
                                title: "",
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: AppColors.orange,
                              ),
                            ),
                            wingoGameHistoryDetail(
                              "Order Number",
                              betHistoryData.orderId.toString(),
                              Colors.orangeAccent,
                            ),
                            wingoGameHistoryDetail(
                              "Period",
                              betHistoryData.gamesNo.toString(),
                              Colors.orangeAccent,
                            ),
                            wingoGameHistoryDetail(
                              "Purchase Amount",
                              "Rs${betHistoryData.amount}",
                              Colors.white,
                            ),
                            wingoGameHistoryDetail(
                              "Amount after TAX",
                              "Rs ${betHistoryData.tradeAmount}",
                              Colors.green,
                            ),
                            wingoGameHistoryDetail(
                              "TAX",
                              "Rs ${betHistoryData.commission}",
                              Colors.green,
                            ),
                            wingoGameHistoryDetail(
                              "Result",
                              betHistoryData.winNumber.toString(),
                              Colors.green,
                            ),
                            wingoGameHistoryDetail(
                              "Select",
                              betHistoryData.winNumber.toString(),
                              Colors.green,
                            ),
                            wingoGameHistoryDetail(
                              "Status",
                              betHistoryData.status == 0
                                  ? "Pending"
                                  : betHistoryData.status == 1
                                      ? "Success"
                                      : "Failed",
                              Colors.red,
                            ),
                            wingoGameHistoryDetail(
                              "Win/Loss",
                              "Rs ${betHistoryData.winAmount.toStringAsFixed(2)}",
                              Colors.red,
                            ),
                            wingoGameHistoryDetail(
                              "Order Time",
                              betHistoryData.createdAt.toString(),
                              Colors.green,
                            ),
                            SizedBox(height: height * 0.01),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  if (pageValue != 1) {
                    _decrementData(winGoHisViewModel);
                  }
                },
                child: Container(
                  height: height * 0.06,
                  width: width * 0.10,
                  decoration: BoxDecoration(
                    gradient: pageValue ==1
                        ? AppColors.boxGradient:AppColors.appBarGradient,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.navigate_before,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
              Sizes.spaceWidth15,
              Row(
                children: [
                  Text(
                    pageValue.toString(),
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  const Text(
                    '/',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.whiteColor,
                      // maxLines: 1,
                    ),
                  ),
                  Text(
                    (((winGoHisViewModel.winGoMyHisModelData!.totalBets! - 1) ~/ 10) + 1).toString(),
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.whiteColor,
                      // maxLines: 1,
                    ),
                  ),
                ],
              ),
              Sizes.spaceWidth15,
              GestureDetector(
                onTap: () {
                  if (pageValue !=
                      ((winGoHisViewModel.winGoMyHisModelData!.totalBets! - 1) ~/ 10) + 1) {
                    _incrementData(winGoHisViewModel);
                  }
                },
                child: Container(
                  height: height * 0.06,
                  width: width * 0.10,
                  decoration: BoxDecoration(
                    gradient: pageValue ==
                        ((winGoHisViewModel.winGoMyHisModelData!.totalBets! -
                            1) ~/
                            10) +
                            1
                        ? AppColors.boxGradient:AppColors.appBarGradient,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:  const Icon(Icons.navigate_next,
                      color: AppColors.whiteColor),
                ),
              ),
            ],
          ),
        ],
      );
    } else {
      return Container(
          height: height * 0.2,
          width: width,
          alignment: Alignment.center,
          child: const Text('No data available!',
              style: TextStyle(color: Colors.white)));
    }
  }

  void _updateData(int increment, WinGoMyHisViewModel winGoHisViewModel) {
    if (winGoHisViewModel.winGoMyHisModelData!.totalBets != null &&
        winGoHisViewModel.winGoMyHisModelData!.totalBets != null) {
      int countValue = winGoHisViewModel.winGoMyHisModelData!.totalBets!;
      if ((currentOffset + increment >= 0) &&
          (currentOffset + increment < countValue)) {
        currentOffset += increment;
        pageValue += increment ~/ 10;
        winGoHisViewModel.myBetHisApi(context,currentOffset);
      } else {
        if (kDebugMode) {
          print('No data available');
        }
      }
    }
  }

  void _incrementData(WinGoMyHisViewModel winGoHisViewModel) {
    _updateData(10,winGoHisViewModel);
  }

  void _decrementData(WinGoMyHisViewModel winGoHisViewMode) {
    _updateData(-10,winGoHisViewMode);
  }

  Widget wingoGameHistoryDetail(
      String label,
      String value,
      Color colorTwo) {
    return Container(
      height: height * 0.06,
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextWidget(
            title: label,
            fontSize: width * 0.035,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          TextWidget(
            title: value,
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: colorTwo,
          ),
        ],
      ),
    );
  }
}
