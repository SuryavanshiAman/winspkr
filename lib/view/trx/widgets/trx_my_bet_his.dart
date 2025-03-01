import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wins_pkr/main.dart';
import 'package:wins_pkr/view/trx/res/trx_colors.dart';
import 'package:wins_pkr/view/trx/view_model/trx_my_bet_his_view_model.dart';

class TrxMyBetHis extends StatefulWidget {
  const TrxMyBetHis({super.key});

  @override
  State<TrxMyBetHis> createState() => _TrxMyBetHisState();
}

class _TrxMyBetHisState extends State<TrxMyBetHis> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final trxMyBetHisViewModel =
          Provider.of<TrxMyBetHisViewModel>(context, listen: false);
      trxMyBetHisViewModel.trxMyBetHisApi(context, 0);
    });
  }

  int currentOffset = 0;
  int pageValue = 1;

  @override
  Widget build(BuildContext context) {
    final trxMyBetHisViewModel = Provider.of<TrxMyBetHisViewModel>(context);
    if (trxMyBetHisViewModel.trxMyBetHisModelData != null &&
        trxMyBetHisViewModel.trxMyBetHisModelData!.data!.isNotEmpty) {
      return Column(
        children: [
          ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: trxMyBetHisViewModel.trxMyBetHisModelData!.data!.length,
            itemBuilder: (context, index) {
              final res =
                  trxMyBetHisViewModel.trxMyBetHisModelData!.data![index];
              List<Color> colors;

              if (res.number == 0) {
                colors = [
                  Colors.red,
                  Colors.purple,
                ];
              } else if (res.number == 5) {
                colors = [
                  const Color(0xFF40ad72),
                  Colors.purple,
                ];
              } else if (res.number == 10) {
                colors = [
                  const Color(0xFF40ad72),
                  const Color(0xFF40ad72),
                ];
              } else if (res.number == 20) {
                colors = [
                  Colors.purple,
                  Colors.purple,
                ];
              } else if (res.number == 30) {
                colors = [
                  Colors.red,
                  Colors.red,
                ];
              } else if (res.number == 40) {
                colors = [
                  TrxColors.goldenColor,
                  TrxColors.goldenColor,
                ];
              } else if (res.number == 50) {
                colors = [const Color(0xff6eb4ff), const Color(0xff6eb4ff)];
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

              return Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  leading: Container(
                      height: height * 0.06,
                      width: width * 0.12,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          // color: Colors.grey
                          gradient: LinearGradient(
                              stops: const [0.5, 0.5],
                              colors: colors,
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight)),
                      child: Center(
                        child: Text(
                          res.number == 40
                              ? 'Big'
                              : res.number == 50
                                  ? 'Small'
                                  : res.number == 10
                                      ? 'G'
                                      : res.number == 20
                                          ? 'V'
                                          : res.number == 30
                                              ? 'R'
                                              : res.number.toString(),
                          style: TextStyle(
                              fontSize: res.number == 40
                                  ? 10
                                  : res.number == 50
                                      ? 10
                                      : 20,
                              fontWeight: FontWeight.w800,
                              color: Colors.black),
                        ),
                      )),
                  title: Text(
                    res.gamesNo.toString(),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: TrxColors.whiteColor,
                    ),
                  ),
                  subtitle: Text(res.createdAt.toString(),
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: Colors.grey)),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: height * 0.042,
                        width: width * 0.2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: res.status == 0
                                    ? Colors.white
                                    : res.status == 2
                                        ? Colors.red
                                        : Colors.green)),
                        child: Center(
                          child: Text(
                            res.status == 2
                                ? 'Failed'
                                : res.status == 0
                                    ? 'Pending'
                                    : 'Succeed',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: res.status == 0
                                    ? Colors.white
                                    : res.status == 2
                                        ? Colors.red
                                        : Colors.green),
                          ),
                        ),
                      ),
                      Text(
                        res.status == 0
                            ? '--'
                            : res.status == 2
                                ? '- Rs${res.amount.toStringAsFixed(2)}'
                                : '+ Rs${res.winAmount.toStringAsFixed(2)}',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: res.status == 0
                                ? Colors.black
                                : res.status == 2
                                    ? Colors.red
                                    : Colors.green),
                      ),
                    ],
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Details',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white),
                              )),
                          const SizedBox(height: 8.0),
                          Container(
                            width: width,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: TrxColors.firstColor),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Order number',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                ),
                                const SizedBox(height: 4.0),
                                Text(
                                  res.orderId.toString(),
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                )
                              ],
                            ),
                          ),
                          historyDetails(
                              'Period', res.gamesNo.toString(), Colors.white),
                          historyDetails('Purchase amount',
                              res.amount.toString(), Colors.white),
                          historyDetails('Amount after tax',
                              res.tradeAmount.toString(), Colors.red),
                          historyDetails(
                              'Tax', res.commission.toString(), Colors.white),
                          historyWinDetails(
                              'Result',
                              res.winNumber == null
                                  ? '--'
                                  : '${res.winNumber}, ',
                              res.winNumber == 5
                                  ? 'Green violet,'
                                  : res.winNumber == 0
                                      ? 'Red Violet,'
                                      : res.winNumber == null
                                          ? ''
                                          : res.winNumber.isOdd
                                              ? 'green,'
                                              : 'red,',
                              res.winNumber == null
                                  ? ''
                                  : res.winNumber < 5
                                      ? 'small'
                                      : 'Big',
                              Colors.white,
                              res.winNumber == null
                                  ? Colors.orange
                                  : res.winNumber.isOdd
                                      ? Colors.green
                                      : Colors.orange,
                              res.winNumber == null
                                  ? Colors.orange
                                  : res.winNumber < 5
                                      ? Colors.yellow
                                      : Colors.blue),
                          historyDetails(
                              'Select',
                              res.number == 50
                                  ? 'small'
                                  : res.number == 40
                                      ? 'big'
                                      : res.number == 10
                                          ? 'Green'
                                          : res.number == 20
                                              ? 'Violet'
                                              : res.number == 30
                                                  ? 'Red'
                                                  : res.number.toString(),
                              Colors.white),
                          historyDetails(
                              'Status',
                              res.status == 0
                                  ? 'Unpaid'
                                  : res.status == 2
                                      ? 'Failed'
                                      : 'Succeed',
                              res.status == 0
                                  ? Colors.white
                                  : res.status == 2
                                      ? Colors.red
                                      : Colors.green),
                          historyDetails(
                              'Win/Loss',
                              res.status == 0
                                  ? '--'
                                  : 'Rs${res.winAmount.toStringAsFixed(2)}',
                              res.status == 0
                                  ? Colors.white
                                  : res.status == 2
                                      ? Colors.red
                                      : Colors.green),
                          historyDetails('Order time', res.createdAt.toString(),
                              Colors.white),
                        ],
                      ),
                    ),
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
                    _decrementData(trxMyBetHisViewModel);
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
                    (((trxMyBetHisViewModel.trxMyBetHisModelData!.totalBets! -
                                    1) ~/
                                10) +
                            1)
                        .toString(),
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: TrxColors.whiteColor,
                      // maxLines: 1,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 15),
              GestureDetector(
                onTap: () {
                  if (pageValue !=
                      ((trxMyBetHisViewModel.trxMyBetHisModelData!.totalBets! -
                                  1) ~/
                              10) +
                          1) {
                    _incrementData(trxMyBetHisViewModel);
                  }
                },
                child: Container(
                  height: height * 0.06,
                  width: width * 0.10,
                  decoration: BoxDecoration(
                    gradient: pageValue ==
                            ((trxMyBetHisViewModel
                                            .trxMyBetHisModelData!.totalBets! -
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

  void _updateData(int increment, TrxMyBetHisViewModel trxMyBetHisViewModel) {
    if (trxMyBetHisViewModel.trxMyBetHisModelData!.totalBets != null &&
        trxMyBetHisViewModel.trxMyBetHisModelData!.totalBets != null) {
      int countValue = trxMyBetHisViewModel.trxMyBetHisModelData!.totalBets!;
      if ((currentOffset + increment >= 0) &&
          (currentOffset + increment < countValue)) {
        currentOffset += increment;
        pageValue += increment ~/ 10;
        trxMyBetHisViewModel.trxMyBetHisApi(context, currentOffset);
      } else {
        if (kDebugMode) {
          print('No data available');
        }
      }
    }
  }

  void _incrementData(TrxMyBetHisViewModel trxMyBetHisViewModel) {
    _updateData(10, trxMyBetHisViewModel);
  }

  void _decrementData(TrxMyBetHisViewModel trxMyBetHisViewModel) {
    _updateData(-10, trxMyBetHisViewModel);
  }

  historyDetails(String title, String subtitle, Color subColor) {
    return Container(
      height: height * 0.05,
      width: width,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: TrxColors.firstColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 12, fontWeight: FontWeight.w700, color: Colors.white),
          ),
          Text(
            subtitle,
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.w700, color: subColor),
          )
        ],
      ),
    );
  }

  historyWinDetails(String title, String subtitle, String subtitle1,
      String subtitle2, Color subColor, Color subColor1, Color subColor2) {
    return Container(
      height: height * 0.05,
      width: width,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: TrxColors.firstColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 12, fontWeight: FontWeight.w700, color: Colors.white),
          ),
          Row(
            children: [
              Text(
                subtitle,
                style: TextStyle(
                    fontSize: 12, fontWeight: FontWeight.w700, color: subColor),
              ),
              Text(
                subtitle1,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: subColor1),
              ),
              Text(
                subtitle2,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: subColor2),
              ),
            ],
          )
        ],
      ),
    );
  }
}
