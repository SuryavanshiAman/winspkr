import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:wins_pkr/Aviator/view_model/aviator_history_view_model.dart';
import 'package:provider/provider.dart';

class AviatorHistory extends StatefulWidget {
  const AviatorHistory({super.key});

  @override
  State<AviatorHistory> createState() => _AviatorHistoryState();
}

class _AviatorHistoryState extends State<AviatorHistory> {
  Color _currentColor = Colors.black;

  @override
  void initState() {
    final aviHisViewModel =
        Provider.of<AviatorHistoryViewModel>(context, listen: false);
    aviHisViewModel.aviatorHistoryApi(context);
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _currentColor = Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0)
            .withOpacity(1.0);
      });
    });
    super.initState();
  }

  double height = 150;
  double width = 300;
  @override
  Widget build(BuildContext context) {
    final aviHisViewModel = Provider.of<AviatorHistoryViewModel>(context);
    if (aviHisViewModel.aviatorHistoryModel == null ||
        aviHisViewModel.aviatorHistoryModel!.status == 400) {
      return const SizedBox(
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.calendar_month_outlined,
              size: 50,
              color: Colors.grey,
            ),
            Text('No Data Found Today',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    width: width * 0.3,
                    child: const Text("Game S.No",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: width * 0.3,
                    child: const Text("Bet, INR X",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    width: width * 0.3,
                    child: const Text("Win, INR",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: aviHisViewModel.aviatorHistoryModel!.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  final res = aviHisViewModel.aviatorHistoryModel!.data![index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 2),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                          color: res.multiplier == null
                              ? Colors.black
                              : const Color(0xff123304),
                          border: Border.all(
                              color: res.multiplier == null
                                  ? Colors.white60
                                  : const Color(0xff406b1f)),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 25,
                            alignment: Alignment.centerLeft,
                            width: width * 0.3,
                            child: Text('2024${res.gameSrNum}',
                                maxLines: 1,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 12)),
                          ),
                          Container(
                              height: 25,
                              alignment: Alignment.center,
                              width: width * 0.3,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                      res.multiplier == null
                                          ? '${res.amount}'
                                          : '${res.amount} , ',
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 12)),
                                  SizedBox(
                                    height: 22,
                                    width: 35,
                                    child: Center(
                                      child: Text(
                                          res.multiplier == null
                                              ? ''
                                              : '${res.multiplier}',
                                          style: TextStyle(
                                              color: _currentColor,
                                              fontSize: 12)),
                                    ),
                                  ),
                                ],
                              )),
                          Container(
                              height: 25,
                              alignment: Alignment.centerRight,
                              width: width * 0.3,
                              child: Text(
                                  res.cashoutAmount == null
                                      ? 'Rs 0.0'
                                      : 'Rs ${res.cashoutAmount}',
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 12))),
                        ],
                      ),
                    ),
                  );
                })
          ],
        ),
      );
    }
  }
}
