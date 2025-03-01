import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wins_pkr/constants/constant_widgets/audio.dart';
import 'package:wins_pkr/constants/gradient_app_bar.dart';
import 'package:wins_pkr/constants/app_colors.dart';
import 'package:wins_pkr/constants/text_widget.dart';
import 'package:wins_pkr/generated/assets.dart';
import 'package:wins_pkr/main.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'package:wins_pkr/view/wingo/res/win_go_wallet.dart';
import 'package:wins_pkr/view/wingo/res/size_const.dart';
import 'package:wins_pkr/view/wingo/controller/win_go_controller.dart';
import 'package:wins_pkr/view/wingo/view_model/win_go_game_his_view_model.dart';
import 'package:wins_pkr/view/wingo/view_model/win_go_my_his_view_model.dart';
import 'package:wins_pkr/view/wingo/view_model/win_go_result_view_model.dart';
import 'package:wins_pkr/view/wingo/widgets/win_go_bottom_sheet.dart';
import 'package:wins_pkr/view/wingo/widgets/win_go_tab.dart';

class WinGo extends StatefulWidget {
  const WinGo({super.key});

  @override
  State<WinGo> createState() => _WinGoState();
}

class _WinGoState extends State<WinGo> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final wgc = Provider.of<WinGoController>(context, listen: false);
      wgc.connectToServer(context);
      if (Audio.audioPlayers.playing) {
        Audio.audioPlayers.stop();
      }
      Audio.audioPlayers = AudioPlayer();
      final winGoResult = Provider.of<WinGoResultViewModel>(context, listen: false);
      winGoResult.wingoResultApi(context, 0, wgc.gameIndex);
      final winGoGameHis = Provider.of<WinGoGameHisViewModel>(context, listen: false);
      winGoGameHis.gameHisApi(context, 0);
    });
  }

  @override
  Future<void> dispose() async {
    super.dispose();
    await Audio.audioPlayers.stop(); // Await the stop operation if it's async
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<WinGoController>(builder: (context, wgc, child) {
      return PopScope(
        canPop: false,
        child: Scaffold(
          appBar: GradientAppBar(
            elevation: 10,
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  wgc.disConnectToServer(context);
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.whiteColor,
                  size: 15,
                )),
            title: const TextWidget(
              title: "Win GO",
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: AppColors.whiteColor,
            ),
          ),
          body: Container(
            height: height,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Assets.imagesAppBg), fit: BoxFit.fill),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: ListView(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                children: [
                  Sizes.spaceHeight10,
                  const WinGoWallet(),
                  Sizes.spaceHeight15,
                  const WingoGameType(),
                  Sizes.spaceHeight15,
                  const WingoContainer(),
                  Sizes.spaceHeight15,
                  const WingoBetWidget(),
                  Sizes.spaceHeight15,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:
                        List.generate(wgc.gameDataTabList.length, (index) {
                      return InkWell(
                        onTap: () {
                          wgc.setGameDataTab(index);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: height * 0.05,
                          width: width * 0.28,
                          decoration: BoxDecoration(
                            gradient: wgc.gameDataTab == index
                                ? AppColors.appBarGradient
                                : AppColors.appButton,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextWidget(
                              title: wgc.gameDataTabList[index],
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.whiteColor),
                        ),
                      );
                    }),
                  ),
                  Sizes.spaceHeight15,
                  const WinGoTab()
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

class WingoGameType extends StatelessWidget {
  const WingoGameType({super.key});

  @override
  Widget build(BuildContext context) {
    final winGoGameHis = Provider.of<WinGoGameHisViewModel>(context);
    final winGoResult = Provider.of<WinGoResultViewModel>(context);
    final winGoMyBetHis = Provider.of<WinGoMyHisViewModel>(context);
    return Consumer<WinGoController>(builder: (context, wgc, child) {
      return Container(
        height: height * 0.15,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(wgc.gameTimerList.length, (index) {
            return InkWell(
              onTap: () {
                // set game index
                // set last five result
                // set game history
                // set chart data
                // set my history
                wgc.setGameTimer(index);
                winGoResult.wingoResultApi(context, 0, index);
                winGoGameHis.gameHisApi(context, 0);
                winGoMyBetHis.myBetHisApi(context, 0);
              },
              child: Container(
                width: width * 0.229,
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 1.5,
                      color: wgc.gameIndex == index
                          ? Colors.grey.withOpacity(0.2)
                          : Colors.transparent),
                  gradient: wgc.gameIndex == index
                      ? AppColors.appBarGradient
                      : AppColors.transparentGradient,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    wgc.gameIndex == index
                        ? Image.asset(
                            Assets.winGoTimeColor,
                            height: height * 0.09,
                          )
                        : Image.asset(
                            Assets.winGoTime,
                            height: height * 0.09,
                          ),
                    TextWidget(
                        title: wgc.gameTimerList[index].title,
                        fontSize: 13,
                        color: wgc.gameIndex == index
                            ? AppColors.whiteColor
                            : AppColors.blackColor),
                    TextWidget(
                        title: wgc.gameTimerList[index].subTitle,
                        fontSize: 13,
                        color: wgc.gameIndex == index
                            ? AppColors.whiteColor
                            : AppColors.blackColor),
                  ],
                ),
              ),
            );
          }),
        ),
      );
    });
  }
}

class WingoContainer extends StatelessWidget {
  const WingoContainer({super.key});
  @override
  Widget build(BuildContext context) {
    final wingoResult = Provider.of<WinGoResultViewModel>(context);
    return Consumer<WinGoController>(builder: (context, wgc, child) {
      int getGameTime() {
        switch (wgc.gameIndex) {
          case 0:
            return wgc.oneMinuteStatus == 1 ? wgc.oneMinuteTime : 0;
          case 1:
            return wgc.threeMinuteStatus == 1 ? wgc.threeMinuteTime : 0;
          case 2:
            return wgc.fiveMinuteStatus == 1 ? wgc.fiveMinuteTime : 0;
          case 3:
            return wgc.tenMinuteStatus == 1 ? wgc.tenMinuteTime : 0;
          default:
            return 0;
        }
      }

      final int gameTime = getGameTime();
      return Container(
        height: height * 0.13,
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.winGoBgCutRed), fit: BoxFit.fill),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    if (kDebugMode) {
                      print('How to play!');
                    }
                  },
                  child: Container(
                    height: 26,
                    width: width * 0.35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: AppColors.whiteColor)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          color: AppColors.whiteColor,
                          Assets.winGoHowToPlay,
                          height: 16,
                        ),
                        const TextWidget(
                          title: ' How to Play',
                          color: AppColors.whiteColor,
                          fontSize: 12,
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    TextWidget(
                      title: wgc.gameTimerList[wgc.gameIndex].title,
                      color: AppColors.whiteColor,
                      fontSize: 12,
                    ),
                    Sizes.spaceWidth5,
                    TextWidget(
                      title: wgc.gameTimerList[wgc.gameIndex].subTitle,
                      color: AppColors.whiteColor,
                      fontSize: 12,
                    ),
                  ],
                ),
                if (wingoResult.wingoResultModelData != null)
                  Row(
                    children: List.generate(
                      min(5, wingoResult.wingoResultModelData!.data!.length),
                      (index) {
                        final resultData =
                            wingoResult.wingoResultModelData!.data![index];
                        final image = wgc.betNumbers.firstWhere(
                          (e) => e['game_id'] == resultData.number,
                        );
                        return Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(image['img']),
                              fit: BoxFit.fill,
                            ),
                          ),
                        );
                      },
                    ),
                  )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const TextWidget(
                  title: 'Time Remaining',
                  color: AppColors.whiteColor,
                  fontSize: 14,
                ),
                Row(
                  children: [
                    Container(
                      height: height * 0.04,
                      width: 30,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                        ),
                      ),
                      child: Text(
                        wgc.formatTime(gameTime, 0), // Minutes
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const TextWidget(
                      title: " : ",
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                    Container(
                      height: height * 0.04,
                      width: 30,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                        ),
                      ),
                      child: Text(
                        wgc.formatTime(gameTime, 1), // Seconds
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                TextWidget(
                  title: wingoResult.gameSrNo != null
                      ? wingoResult.gameSrNo.toString()
                      : '',
                  color: AppColors.whiteColor,
                  fontSize: 14,
                ),
              ],
            )
          ],
        ),
      );
    });
  }
}

class WingoBetWidget extends StatefulWidget {
  const WingoBetWidget({super.key});

  @override
  State<WingoBetWidget> createState() => _WingoBetWidgetState();
}

class _WingoBetWidgetState extends State<WingoBetWidget> {
  BuildContext? bottomSheetContext;

  @override
  Widget build(BuildContext context) {
    return Consumer<WinGoController>(builder: (context, wgc, child) {
      return Stack(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(wgc.colorBetList.length, (index) {
                  return InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          isDismissible: false,
                          builder: (context) {
                            bottomSheetContext = context;
                            return WinGoBottomSheet(
                              data: wgc.colorBetList[index],
                            );
                          });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: height * 0.05,
                      width: width * 0.28,
                      decoration: BoxDecoration(
                        color: wgc.colorBetList[index]['col1'],
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                      child: TextWidget(
                        title: '${wgc.colorBetList[index]['title']}',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  );
                }),
              ),
              Sizes.spaceHeight15,
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: const BoxDecoration(
                    color: AppColors.lightMarron,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  shrinkWrap: true,
                  itemCount: wgc.betNumbers.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            isDismissible: false,
                            builder: (context) {
                              bottomSheetContext = context;
                              return WinGoBottomSheet(
                                data: wgc.betNumbers[index],
                              );
                            });
                      },
                      child: Image(
                        image: AssetImage(wgc.betNumbers[index]['img']),
                        height: height / 12,
                      ),
                    );
                  },
                ),
              ),
              Sizes.spaceHeight15,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(wgc.bigSmallList.length, (index) {
                  return InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          isDismissible: false,
                          builder: (context) {
                            bottomSheetContext = context;
                            return WinGoBottomSheet(
                              data: wgc.bigSmallList[index],
                            );
                          });
                    },
                    child: Container(
                      height: height * 0.05,
                      width: width * 0.38,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: wgc.bigSmallList[index]['col1'],
                        borderRadius: BorderRadius.only(
                          topLeft: index == 0
                              ? const Radius.circular(30)
                              : Radius.zero,
                          bottomLeft: index == 0
                              ? const Radius.circular(30)
                              : Radius.zero,
                          topRight: index == wgc.bigSmallList.length - 1
                              ? const Radius.circular(30)
                              : Radius.zero,
                          bottomRight: index == wgc.bigSmallList.length - 1
                              ? const Radius.circular(30)
                              : Radius.zero,
                        ),
                      ),
                      child: TextWidget(
                        title: '${wgc.bigSmallList[index]['title']}',
                        color: AppColors.whiteColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
          _buildRemainingTimeWidget(wgc),
        ],
      );
    });
  }

  Widget _buildRemainingTimeWidget(WinGoController wgc) {
    int remainingTime;

    bool isSoundPlaying = false;

    if (wgc.gameIndex == 0 && ((wgc.oneMinuteStatus == 1 && wgc.oneMinuteTime <= 5) || wgc.oneMinuteStatus == 2)) {
      remainingTime = wgc.oneMinuteStatus == 2 ? 0 : wgc.oneMinuteTime;

      if (!isSoundPlaying && remainingTime > 0) {
        Audio.WingoTimerone();
        isSoundPlaying = true;
      }
    } else if (wgc.gameIndex == 1 &&
        ((wgc.threeMinuteStatus == 1 && wgc.threeMinuteTime <= 5) ||
            wgc.threeMinuteStatus == 2)) {
      remainingTime = wgc.threeMinuteStatus == 2 ? 0 : wgc.threeMinuteTime;

      if (!isSoundPlaying && remainingTime > 0) {
        Audio.WingoTimerone();
        isSoundPlaying = true;
      }
    } else if (wgc.gameIndex == 2 &&
        ((wgc.fiveMinuteStatus == 1 && wgc.fiveMinuteTime <= 5) ||
            wgc.fiveMinuteStatus == 2)) {
      remainingTime = wgc.fiveMinuteStatus == 2 ? 0 : wgc.fiveMinuteTime;

      if (!isSoundPlaying && remainingTime > 0) {
        Audio.WingoTimerone();
        isSoundPlaying = true;
      }
    } else if (wgc.gameIndex == 3 &&
        ((wgc.tenMinuteStatus == 1 && wgc.tenMinuteTime <= 5) ||
            wgc.tenMinuteStatus == 2)) {
      remainingTime = wgc.tenMinuteStatus == 2 ? 0 : wgc.tenMinuteTime;

      if (!isSoundPlaying && remainingTime > 0) {
        Audio.WingoTimerone();
        isSoundPlaying = true;
      }
    } else {
      return const SizedBox();
    }

    return RemainingTime(time: remainingTime);
  }


}

class RemainingTime extends StatelessWidget {
  final int time;
  const RemainingTime({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      _comContainer(0),
      _comContainer(time),
    ]);
  }

  Widget _comContainer(int time) {
    return Container(
      height: height * 0.3,
      width: width * 0.4,
      alignment: Alignment.center,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: AppColors.greenGradient,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        time.toString(),
        style: const TextStyle(
          fontWeight: FontWeight.w900,
          color: AppColors.whiteColor,
          fontSize: 150,
          fontFamily: 'rob_con_ex_bold',
        ),
      ),
    );
  }
}