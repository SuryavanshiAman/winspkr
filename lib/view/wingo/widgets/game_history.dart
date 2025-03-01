import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wins_pkr/constants/app_colors.dart';
import 'package:wins_pkr/constants/text_widget.dart';
import 'package:wins_pkr/main.dart';
import 'package:wins_pkr/view/wingo/controller/win_go_controller.dart';
import 'package:wins_pkr/view/wingo/res/gradient_text.dart';
import 'package:wins_pkr/view/wingo/res/size_const.dart';
import 'package:wins_pkr/view/wingo/view_model/win_go_game_his_view_model.dart';

class GameHistory extends StatefulWidget {
  const GameHistory({super.key});

  @override
  State<GameHistory> createState() => _GameHistoryState();
}

class _GameHistoryState extends State<GameHistory> {
  int currentOffset = 0;
  int pageValue = 1;
  @override
  Widget build(BuildContext context) {
    final winGoGameHisData = Provider.of<WinGoGameHisViewModel>(context);
    return Consumer<WinGoController>(builder: (context, wgc, child) {
      if (winGoGameHisData.winGoGameHisModelData != null &&
          winGoGameHisData.winGoGameHisModelData!.data!.isNotEmpty) {
        return Column(
          children: [
            Container(
                height: height * 0.06,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  gradient: AppColors.appBarGradient,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: width * 0.21,
                      child: const TextWidget(
                          title: 'Period',
                          fontSize: 14,
                          fontWeight: FontWeight.w900,
                          color: AppColors.whiteColor),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: width * 0.21,
                      child: const TextWidget(
                          title: 'Number',
                          fontSize: 14,
                          fontWeight: FontWeight.w900,
                          color: AppColors.whiteColor),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: width * 0.21,
                      child: const TextWidget(
                          title: 'Big Small',
                          fontSize: 14,
                          fontWeight: FontWeight.w900,
                          color: AppColors.whiteColor),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: width * 0.21,
                      child: const TextWidget(
                          title: 'Color',
                          fontSize: 14,
                          fontWeight: FontWeight.w900,
                          color: AppColors.whiteColor),
                    ),
                  ],
                )),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: winGoGameHisData.winGoGameHisModelData!.data!.length,
              itemBuilder: (context, index) {
                final resultData =
                winGoGameHisData.winGoGameHisModelData!.data![index];
                final color = wgc.betNumbers.firstWhere(
                    (e) => e['game_id'] == resultData.number,
                    orElse: () => null);
                return InkWell(
                  onTap: () {
                    wgc.setGameHistorySelect(index.toString());
                  },
                  child: Column(
                    children: [
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: height * 0.06,
                            width: width * 0.23,
                            child: FittedBox(
                              child: TextWidget(
                                title: resultData.gamesNo.toString(),
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColors.whiteColor,
                              ),
                            ),
                          ),
                          SizedBox(width: width*0.022,),
                          Container(
                            alignment: Alignment.center,
                            width: width * 0.21,
                            height: height * 0.06,
                            child: GradientText(
                              resultData.number.toString(),
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                              ),
                              gradient: LinearGradient(
                                colors: [
                                  color['col1'],
                                  color['col2'],
                                ],
                                stops: const [0.5, 0.5],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                                tileMode: TileMode.mirror,
                              ),
                            ),
                          ),
                          SizedBox(width: width*0.03,),
                          Container(
                            alignment: Alignment.center,
                            width: width * 0.21,
                            child: TextWidget(
                              title: resultData.number! > 4 &&
                                  resultData.number! < 10
                                  ? 'Big'
                                  : 'Small',
                              fontSize: 14,
                              fontWeight: FontWeight.w900,
                              color: resultData.number! > 4 &&
                                  resultData.number! < 10
                                  ? Colors.yellow
                                  : Colors.blue,
                            ),
                          ),
                          SizedBox(width: width*0.12),
                          Container(
                            alignment: Alignment.center,
                            width: 15,
                            height: 15,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: [
                                  color['col1'],
                                  color['col2'],
                                ],
                                stops: const [0.5, 0.5],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (index !=
                          winGoGameHisData.winGoGameHisModelData!.data!.length - 1)
                        Container(
                            width: width, color: Colors.grey, height: 0.5),
                    ],
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
                      _decrementData(winGoGameHisData);
                    }
                  },
                  child: Container(
                    height: height * 0.06,
                    width: width * 0.10,
                    decoration: BoxDecoration(
                      gradient: pageValue == 1
                          ? AppColors.boxGradient
                          : AppColors.appBarGradient,
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
                      (((winGoGameHisData.winGoGameHisModelData!.totalBets! -
                          1) ~/
                          10) +
                          1)
                          .toString(),
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ],
                ),
                Sizes.spaceWidth15,
                GestureDetector(
                  onTap: () {
                    if (pageValue !=
                        ((winGoGameHisData.winGoGameHisModelData!.totalBets! -
                            1) ~/
                            10) +
                            1) {
                      _incrementData(winGoGameHisData);
                    }
                  },
                  child: Container(
                    height: height * 0.06,
                    width: width * 0.10,
                    decoration: BoxDecoration(
                      gradient: pageValue ==
                          ((winGoGameHisData.winGoGameHisModelData!
                              .totalBets! -
                              1) ~/
                              10) +
                              1
                          ? AppColors.boxGradient
                          : AppColors.appBarGradient,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.navigate_next,
                        color: AppColors.whiteColor),
                  ),
                ),
              ],
            ),
          ],
        );
      }else {
        return Container(
            height: height * 0.2,
            width: width,
            alignment: Alignment.center,
            child: const Text('No data available!',
                style: TextStyle(color: Colors.white)));
      }
    });
  }

  void _updateData(int increment, WinGoGameHisViewModel winGoGameHisData) {
    if (winGoGameHisData.winGoGameHisModelData!.totalBets != null &&
        winGoGameHisData.winGoGameHisModelData!.totalBets != null) {
      int countValue = winGoGameHisData.winGoGameHisModelData!.totalBets!;
      if ((currentOffset + increment >= 0) &&
          (currentOffset + increment < countValue)) {
        currentOffset += increment;
        pageValue += increment ~/ 10;
        winGoGameHisData.gameHisApi(context, currentOffset);
      } else {
        if (kDebugMode) {
          print('No data available');
        }
      }
    }
  }

  void _incrementData(WinGoGameHisViewModel winGoResultViewModel) {
    _updateData(10, winGoResultViewModel);
  }

  void _decrementData(WinGoGameHisViewModel winGoResultViewModel) {
    _updateData(-10, winGoResultViewModel);
  }
}
