import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:wins_pkr/main.dart';
import 'package:wins_pkr/view/trx/res/trx_colors.dart';
import 'package:wins_pkr/view/trx/res/trx_text_widget.dart';
import 'package:wins_pkr/view/trx/view_model/trx_game_his_view_model.dart';

class TrxGameHis extends StatefulWidget {
  const TrxGameHis({super.key});

  @override
  State<TrxGameHis> createState() => _TrxGameHisState();
}

class _TrxGameHisState extends State<TrxGameHis> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final trxGameHisViewModel =
          Provider.of<TrxGameHisViewModel>(context, listen: false);
      trxGameHisViewModel.trxGameHisApi(context, 0);
    });
  }

  int currentOffset = 0;
  int pageValue = 1;
  @override
  Widget build(BuildContext context) {
    final trxGameHisViewModel = Provider.of<TrxGameHisViewModel>(context);
    if (trxGameHisViewModel.trxGameHisModelData != null &&
        trxGameHisViewModel.trxGameHisModelData!.data!.isNotEmpty) {
      return Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15),
            decoration: const BoxDecoration(
                gradient: TrxColors.appBarGradient,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: width * 0.18,
                  child: const TrxTextWidget(
                      title: 'Period',
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                      color: TrxColors.whiteColor),
                ),
                Container(
                  alignment: Alignment.center,
                  width: width * 0.17,
                  child: const TrxTextWidget(
                      title: 'Block',
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                      color: TrxColors.whiteColor),
                ),
                Container(
                  alignment: Alignment.center,
                  width: width * 0.21,
                  child: const TrxTextWidget(
                      title: 'Block Time',
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                      color: TrxColors.whiteColor),
                ),
                Container(
                  alignment: Alignment.center,
                  width: width * 0.13,
                  child: const TrxTextWidget(
                      title: 'Hash',
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                      color: TrxColors.whiteColor),
                ),
                Container(
                  alignment: Alignment.center,
                  width: width * 0.15,
                  child: const TrxTextWidget(
                      title: 'Result',
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                      color: TrxColors.whiteColor),
                ),
              ],
            ),
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: trxGameHisViewModel.trxGameHisModelData!.data!.length,
            itemBuilder: (context, index) {
              final res = trxGameHisViewModel.trxGameHisModelData!.data![index];
              List<Color> colors;
              if (res.number == 0) {
                colors = [Colors.red, Colors.purple];
              } else if (res.number == 5) {
                colors = [const Color(0xFF40ad72), Colors.purple];
              } else {
                int number = int.parse(res.number.toString());
                colors = number.isOdd
                    ? [
                        const Color(0xFF40ad72),
                        const Color(0xFF40ad72),
                      ]
                    : [
                        Colors.red,
                        Colors.red,
                      ];
              }

              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: height * 0.09,
                        alignment: Alignment.center,
                        width: width * 0.2,
                        child: TrxTextWidget(
                          title: obscureCenterDigits(res.gamesNo.toString()),
                          fontSize: 10,
                          color: TrxColors.whiteColor,
                          fontWeight: FontWeight.w600,
                          maxLines: 1,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.09,
                        width: width * 0.18,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TrxTextWidget(
                              //block
                              title: res.block.toString(),
                              fontSize: 12,
                              color: TrxColors.whiteColor,
                              fontWeight: FontWeight.w600,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: height * 0.09,
                        alignment: Alignment.center,
                        width: width * 0.21,
                        child: TrxTextWidget(
                          title: DateFormat('HH:mm:ss')
                              .format(DateTime.parse(res.createdAt.toString())),
                          fontSize: 12,
                          color: TrxColors.whiteColor,
                          fontWeight: FontWeight.w600,
                          maxLines: 1,
                        ),
                      ),
                      Container(
                        height: height * 0.09,
                        alignment: Alignment.center,
                        width: width * 0.13,
                        child: TrxTextWidget(
                          //hash
                          title: res.token.toString(),
                          fontSize: 12,
                          color: TrxColors.whiteColor,
                          fontWeight: FontWeight.w600,
                          maxLines: 1,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.09,
                        width: width * 0.15,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            res.number == 5
                                ? Container(
                                    height: height * 0.05,
                                    width: width * 0.05,
                                    margin: const EdgeInsets.all(2),
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0xFF40ad72),
                                            Colors.purple
                                          ],
                                        )),
                                    child: Text(
                                      res.number.toString(),
                                      style: const TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ))
                                : res.number == 0
                                    ? Container(
                                        height: height * 0.05,
                                        width: width * 0.05,
                                        margin: const EdgeInsets.all(2),
                                        alignment: Alignment.center,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            gradient: LinearGradient(
                                              colors: [
                                                Colors.red,
                                                Colors.purple
                                              ],
                                            )),
                                        child: Text(
                                          res.number.toString(),
                                          style: const TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w900,
                                              color: Colors.white),
                                        ))
                                    : Container(
                                        height: height * 0.05,
                                        width: width * 0.05,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          gradient: LinearGradient(
                                            colors: colors,
                                            stops: const [0.5, 0.5],
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            tileMode: TileMode.mirror,
                                          ),
                                        ),
                                        child: Center(
                                          child: TrxTextWidget(
                                              title: res.number.toString(),
                                              fontSize: 10,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white),
                                        )),
                            GradientTextview(
                              int.parse(res.number.toString()) < 5 ? 'S' : 'B',
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w900),
                              gradient: res.number! < 5
                                  ? TrxColors.loginSecondaryGrid
                                  : TrxColors.appButton,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  if (trxGameHisViewModel.trxGameHisModelData!.data!.length -
                          1 !=
                      index)
                    Container(
                        width: width, color: TrxColors.whiteColor, height: 0.5),
                ],
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  if (pageValue != 1) {
                    _decrementData(trxGameHisViewModel);
                  }
                },
                child: Container(
                  height: height * 0.06,
                  width: width * 0.10,
                  decoration: BoxDecoration(
                    gradient: pageValue == 1
                        ? TrxColors.boxGradient
                        : TrxColors.appBarGradient,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.navigate_before,
                    color: TrxColors.whiteColor,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Row(
                children: [
                  Text(
                    pageValue.toString(),
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: TrxColors.whiteColor,
                    ),
                  ),
                  const Text(
                    '/',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: TrxColors.whiteColor,
                      // maxLines: 1,
                    ),
                  ),
                  Text(
                    (((trxGameHisViewModel.trxGameHisModelData!.totalResult! -
                                    1) ~/
                                10) +
                            1)
                        .toString(),
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: TrxColors.whiteColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 15),
              GestureDetector(
                onTap: () {
                  if (pageValue !=
                      ((trxGameHisViewModel.trxGameHisModelData!.totalResult! -
                                  1) ~/
                              10) +
                          1) {
                    _incrementData(trxGameHisViewModel);
                  }
                },
                child: Container(
                  height: height * 0.06,
                  width: width * 0.10,
                  decoration: BoxDecoration(
                    gradient: pageValue ==
                            ((trxGameHisViewModel
                                            .trxGameHisModelData!.totalResult! -
                                        1) ~/
                                    10) +
                                1
                        ? TrxColors.boxGradient
                        : TrxColors.appBarGradient,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.navigate_next,
                      color: TrxColors.whiteColor),
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

  String obscureCenterDigits(String input) {
    if (input.length < 4) {
      return input;
    }
    int length = input.length;
    int startIndex = (length ~/ 2) - 1;
    int endIndex = (length ~/ 2) + 1;
    List<String> chars = input.split('');
    for (int i = startIndex; i <= endIndex; i++) {
      chars[i] = '*';
    }
    return chars.join('');
  }

  void _updateData(int increment, TrxGameHisViewModel trxGameHisData) {
    if (trxGameHisData.trxGameHisModelData!.totalResult != null &&
        trxGameHisData.trxGameHisModelData!.totalResult != null) {
      int countValue = trxGameHisData.trxGameHisModelData!.totalResult!;
      if ((currentOffset + increment >= 0) &&
          (currentOffset + increment < countValue)) {
        currentOffset += increment;
        pageValue += increment ~/ 10;
        trxGameHisData.trxGameHisApi(context, currentOffset);
      } else {
        if (kDebugMode) {
          print('No data available');
        }
      }
    }
  }

  void _incrementData(TrxGameHisViewModel trxGameHisData) {
    _updateData(10, trxGameHisData);
  }

  void _decrementData(TrxGameHisViewModel trxGameHisData) {
    _updateData(-10, trxGameHisData);
  }
}

class GradientTextview extends StatelessWidget {
  const GradientTextview(
    this.text, {
    super.key,
    required this.gradient,
    this.style,
  });

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}
