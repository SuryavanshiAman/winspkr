import 'package:wins_pkr/constants/constant_widgets/audio.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'package:wins_pkr/constants/gradient_app_bar.dart';
import 'package:wins_pkr/constants/text_widget.dart';
import 'package:wins_pkr/main.dart';
import 'package:flutter/material.dart';
import 'package:wins_pkr/generated/assets.dart';
import 'package:wins_pkr/view/trx/controller/trx_controller.dart';
import 'package:wins_pkr/view/trx/res/trx_colors.dart';
import 'package:wins_pkr/view/trx/view_model/trx_game_his_view_model.dart';
import 'package:wins_pkr/view/trx/view_model/trx_my_bet_his_view_model.dart';
import 'package:wins_pkr/view/trx/view_model/trx_result_view_model.dart';
import 'package:wins_pkr/view/trx/widgets/trx_bottom_sheet.dart';
import 'package:wins_pkr/view/trx/widgets/trx_tab.dart';
import 'package:wins_pkr/view/trx/widgets/trx_wallet.dart';

class Trx extends StatefulWidget {
  const Trx({super.key});

  @override
  TrxState createState() => TrxState();
}

class TrxState extends State<Trx> with SingleTickerProviderStateMixin {
  late int selectedCatIndex;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final trc = Provider.of<TrxController>(context, listen: false);
      trc.connectToServer(context);
      if (Audio.audioPlayers.playing) {
        Audio.audioPlayers.stop();
      }
      Audio.audioPlayers = AudioPlayer();
      final trxResult = Provider.of<TrxResultViewModel>(context, listen: false);
      trxResult.trxResultApi(context, 0);
      final trxGameHisViewModel =
          Provider.of<TrxGameHisViewModel>(context, listen: false);
      trxGameHisViewModel.trxGameHisApi(context, 0);
    });
  }
  @override
  void dispose() {
    super.dispose();
    Audio.audioPlayers.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TrxController>(builder: (context, trc, child) {
      return PopScope(
        canPop: false,
        child: Scaffold(
            backgroundColor: TrxColors.blackColor,
            resizeToAvoidBottomInset: true,
            appBar: GradientAppBar(
              elevation: 10,
              centerTitle: true,
              leading: IconButton(
                  onPressed: () {
                    trc.disConnectToServer(context);
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: TrxColors.whiteColor,
                    size: 15,
                  )),
              title: const TextWidget(
                title: "TRX",
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: TrxColors.whiteColor,
              ),
            ),
            body: Container(
              height: height,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Assets.imagesAppBg), fit: BoxFit.fill),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    const TrxWallet(),
                    const SizedBox(height: 5),
                    const TrxGameType(),
                    const SizedBox(height: 15),
                    const TrxContainer(),
                    const SizedBox(height: 15),
                    const TrxBetWidget(),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(trc.trxTabList.length, (index) {
                        return InkWell(
                          onTap: () {
                            trc.setGameDataTab(index);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: height * 0.05,
                            width: width * 0.28,
                            decoration: BoxDecoration(
                              gradient: trc.trxDataTab == index
                                  ? TrxColors.appBarGradient
                                  : TrxColors.appButton,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextWidget(
                                title: trc.trxTabList[index],
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: TrxColors.whiteColor),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 15),
                    const TrxTab()
                  ],
                ),
              ),
            )),
      );
    });
  }
}

class TrxGameType extends StatelessWidget {
  const TrxGameType({super.key});

  @override
  Widget build(BuildContext context) {
    final trxGameHis = Provider.of<TrxGameHisViewModel>(context);
    final trxResult = Provider.of<TrxResultViewModel>(context);
    final trxMyBetHis = Provider.of<TrxMyBetHisViewModel>(context);
    return Consumer<TrxController>(builder: (context, trc, child) {
      return Container(
        height: height * 0.15,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(trc.trxTimerList.length, (index) {
            final res = trc.trxTimerList[index];
            return InkWell(
              onTap: () {
                // set game index
                // set last five result
                // set game history
                // set chart data
                // set my history
                trc.setTrxTimer(index);
                trxResult.trxResultApi(context, 0);
                trxGameHis.trxGameHisApi(context, 0);
                trxMyBetHis.trxMyBetHisApi(context, 0);
              },
              child: Container(
                width: width * 0.229,
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 1.5,
                      color: trc.gameIndex == index
                          ? Colors.grey.withOpacity(0.2)
                          : Colors.transparent),
                  gradient: trc.gameIndex == index
                      ? TrxColors.appBarGradient
                      : TrxColors.transparentGradient,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    trc.gameIndex == index
                        ? Image.asset(
                            Assets.trxTimeColor,
                            height: height * 0.09,
                          )
                        : Image.asset(
                            Assets.trxTime,
                            height: height * 0.09,
                          ),
                    TextWidget(
                        title: res.title,
                        fontSize: 13,
                        color: trc.gameIndex == index
                            ? TrxColors.whiteColor
                            : TrxColors.blackColor),
                    TextWidget(
                        title: res.subTitle,
                        fontSize: 13,
                        color: trc.gameIndex == index
                            ? TrxColors.whiteColor
                            : TrxColors.blackColor),
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

class TrxContainer extends StatelessWidget {
  const TrxContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final trxResult = Provider.of<TrxResultViewModel>(context);
    return Consumer<TrxController>(builder: (context, trc, child) {
      int getGameTime() {
        switch (trc.gameIndex) {
          case 0:
            return trc.oneMinuteStatus == 1 ? trc.oneMinuteTime : 0;
          case 1:
            return trc.threeMinuteStatus == 1 ? trc.threeMinuteTime : 0;
          case 2:
            return trc.fiveMinuteStatus == 1 ? trc.fiveMinuteTime : 0;
          case 3:
            return trc.tenMinuteStatus == 1 ? trc.tenMinuteTime : 0;
          default:
            return 0;
        }
      }

      final int gameTime = getGameTime();
      List<String> dataList =
          trxResult.trxResultModelData?.data?.token?.split('') ?? [];
      return Container(
        height: height * 0.28,
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.trxBgCut), fit: BoxFit.fill)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    height: height * 0.04,
                    width: width * 0.17,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: TrxColors.whiteColor,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(
                      child: Text(
                        'Period',
                        style: TextStyle(color: TrxColors.whiteColor),
                      ),
                    )),
                GestureDetector(
                  onTap: () {
                    // How to play
                  },
                  child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      height: height * 0.04,
                      width: width * 0.26,
                      decoration: BoxDecoration(
                        color: TrxColors.whiteColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'How to Play',
                            style: TextStyle(color: TrxColors.blackColor),
                          ),
                        ],
                      )),
                ),
                GestureDetector(
                  onTap: () {
                    // Public chain Query
                  },
                  child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      height: height * 0.04,
                      width: width * 0.4,
                      decoration: BoxDecoration(
                        color: TrxColors.whiteColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Public chain Query',
                            style: TextStyle(color: TrxColors.blackColor),
                          ),
                        ],
                      )),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Trx Win Go ${trc.trxTimerList[trc.gameIndex].subTitle}',
                      style: const TextStyle(color: TrxColors.whiteColor),
                    ),
                    Text(
                      // result view model
                      '${trxResult.gameSrNo ?? ''}',
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: TrxColors.whiteColor),
                    ),
                  ],
                ),
                buildTime1(gameTime),
              ],
            ),
            SizedBox(height: height * 0.05),
            if (trxResult.trxResultModelData != null &&
                trxResult.trxResultModelData!.data != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(dataList.length, (index) {
                  final imagePath = trc.betNumbers
                      .firstWhere((e) => e.gameId == int.parse(dataList[dataList.length-1]))
                      .img;
                  return Container(
                    height: 60,
                    width: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border:index!=dataList.length - 1? Border.all(color: Colors.black38,width: 2):null,
                      image: index==dataList.length - 1?DecorationImage(
                        image: AssetImage(imagePath!),
                        fit: BoxFit.cover,
                      ):null,
                    ),
                    child: index!=dataList.length - 1?TextWidget(
                      title: dataList[index].toUpperCase(),
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      fontSize: 20,
                    ):null,
                  );
                }),
              ),
          ],
        ),
      );
    });
  }

  Widget buildTime1(int time) {
    Duration myDuration = Duration(seconds: time);
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = strDigits(myDuration.inMinutes.remainder(11));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));

    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      buildTimeCard2(time: minutes[0].toString(), header: 'MINUTES'),
      const SizedBox(width: 3),
      buildTimeCard1(time: minutes[1].toString(), header: 'MINUTES'),
      const SizedBox(width: 3),
      buildTimeCard1(time: ':', header: 'MINUTES'),
      const SizedBox(width: 3),
      buildTimeCard1(time: seconds[0].toString(), header: 'SECONDS'),
      const SizedBox(width: 3),
      buildTimeCard3(time: seconds[1].toString(), header: 'SECONDS'),
    ]);
  }

  Widget buildTimeCard3({required String time, required String header}) =>
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment
                    .bottomRight, // Adjusted to start from bottom right
                end: Alignment.topLeft, // Adjusted to end at top left
                colors: [
                  Colors.transparent,
                  Color(0xFF759FDE), // Hex color equivalent to #759FDE
                ],
                stops: [
                  0.12,
                  0.13333
                ], // Adjust these stops according to your design
              ),
            ),
            child: Text(
              time,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          )
        ],
      );
  Widget buildTimeCard2({required String time, required String header}) =>
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xff6ab5fe),
                  Color(0xFF759FDE), // Hex color equivalent to #759FDE
                ],
                stops: [
                  0.1333,
                  0.12,
                ], // Adjust these stops according to your design
              ),
            ),
            child: Text(
              time,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 15),
            ),
          ),
        ],
      );
  Widget buildTimeCard1({required String time, required String header}) =>
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF759FDE), Color(0xFF759FDE)],
              ),
            ),
            child: Text(
              time,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 15),
            ),
          ),
        ],
      );
}

class TrxBetWidget extends StatelessWidget {
  const TrxBetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TrxController>(builder: (context, trc, child) {
      return Stack(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(trc.colorBetList.length, (index) {
                  return InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          isDismissible: false,
                          builder: (context) {
                            return TrxBottomSheet(
                              data: trc.colorBetList[index],
                            );
                          });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: height * 0.05,
                      width: width * 0.28,
                      decoration: BoxDecoration(
                        color: trc.colorBetList[index].colFir,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                      child: TextWidget(
                        title: trc.colorBetList[index].title,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: TrxColors.whiteColor,
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 15),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: const BoxDecoration(
                    color: TrxColors.lightMarron,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  shrinkWrap: true,
                  itemCount: trc.betNumbers.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            isDismissible: false,
                            builder: (context) {
                              return TrxBottomSheet(
                                data: trc.betNumbers[index],
                              );
                            });
                      },
                      child: Image(
                        image: AssetImage(trc.betNumbers[index].img!),
                        height: height / 12,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(trc.bigSmallList.length, (index) {
                  return InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          isDismissible: false,
                          builder: (context) {
                            return TrxBottomSheet(
                              data: trc.bigSmallList[index],
                            );
                          });
                    },
                    child: Container(
                      height: height * 0.05,
                      width: width * 0.38,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: trc.bigSmallList[index].colFir,
                        borderRadius: BorderRadius.only(
                          topLeft: index == 0
                              ? const Radius.circular(30)
                              : Radius.zero,
                          bottomLeft: index == 0
                              ? const Radius.circular(30)
                              : Radius.zero,
                          topRight: index == trc.bigSmallList.length - 1
                              ? const Radius.circular(30)
                              : Radius.zero,
                          bottomRight: index == trc.bigSmallList.length - 1
                              ? const Radius.circular(30)
                              : Radius.zero,
                        ),
                      ),
                      child: TextWidget(
                        title: trc.bigSmallList[index].title,
                        color: TrxColors.whiteColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
          _buildRemainingTimeWidget(trc),
        ],
      );
    });
  }

  Widget _buildRemainingTimeWidget(TrxController trc) {
    int remainingTime;

    bool isSoundPlaying = false;

    if (trc.gameIndex == 0 &&
        ((trc.oneMinuteStatus == 1 && trc.oneMinuteTime <= 5) ||
            trc.oneMinuteStatus == 2)) {
      remainingTime = trc.oneMinuteStatus == 2 ? 0 : trc.oneMinuteTime;



      if (!isSoundPlaying && remainingTime > 0) {
        Audio.WingoTimerone();
        isSoundPlaying = true;
      }



    } else if (trc.gameIndex == 1 &&
        ((trc.threeMinuteStatus == 1 && trc.threeMinuteTime <= 5) ||
            trc.threeMinuteStatus == 2)) {
      remainingTime = trc.threeMinuteStatus == 2 ? 0 : trc.threeMinuteTime;

      if (!isSoundPlaying && remainingTime > 0) {
        Audio.WingoTimerone();
        isSoundPlaying = true;
      }

    } else if (trc.gameIndex == 2 &&
        ((trc.fiveMinuteStatus == 1 && trc.fiveMinuteTime <= 5) ||
            trc.fiveMinuteStatus == 2)) {
      remainingTime = trc.fiveMinuteStatus == 2 ? 0 : trc.fiveMinuteTime;
      if (!isSoundPlaying && remainingTime > 0) {
        Audio.WingoTimerone();
        isSoundPlaying = true;
      }

    } else if (trc.gameIndex == 3 &&
        ((trc.tenMinuteStatus == 1 && trc.tenMinuteTime <= 5) ||
            trc.tenMinuteStatus == 2)) {
      remainingTime = trc.tenMinuteStatus == 2 ? 0 : trc.tenMinuteTime;
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
        gradient: TrxColors.loginSecondaryGrid,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        time.toString(),
        style: const TextStyle(
          fontWeight: FontWeight.w900,
          color: TrxColors.whiteColor,
          fontSize: 150,
          fontFamily: 'rob_con_ex_bold',
        ),
      ),
    );
  }







}
