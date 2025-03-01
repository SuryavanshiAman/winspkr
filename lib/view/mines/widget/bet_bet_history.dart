import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wins_pkr/generated/assets.dart';
import 'package:wins_pkr/main.dart';
import 'package:wins_pkr/view/mines/view_model/mine_bet_his_view_model.dart';

class MineBetHistory extends StatefulWidget {
  const MineBetHistory({super.key});

  @override
  State<MineBetHistory> createState() => _MineBetHistoryState();
}

class _MineBetHistoryState extends State<MineBetHistory> {
  @override
  void initState() {
    super.initState();
    final mineBetHisViewModel =
        Provider.of<MineBetHisViewModel>(context, listen: false);
    mineBetHisViewModel.mineBetHisApi(context, 0);
  }

  @override
  Widget build(BuildContext context) {
    final mineBetHisViewModel = Provider.of<MineBetHisViewModel>(context);
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          height: height * 0.8,
          width: width * 0.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xff212226).withOpacity(0.9),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: width * 0.05,
                      ),
                      const Text(
                        'GAME HISTORY',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.cancel_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: height,
                    width: width,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: width * 0.25,
                                child: const Center(
                                  child: Text(
                                    'Time',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: width * 0.15,
                                child: const Center(
                                  child: Text(
                                    'Bet',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: width * 0.2,
                                child: const Center(
                                  child: Text(
                                    'Cash out',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: width * 0.2,
                                child: const Text(
                                  'Multiplier',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Divider(
                            color: Colors.white,
                          ),
                          mineBetHisViewModel.mineBetHisModelData == null ||
                                  mineBetHisViewModel
                                      .mineBetHisModelData!.data!.isEmpty
                              ? const NoDataAvailable()
                              : SizedBox(
                                  height: height * 0.55,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      physics: const ScrollPhysics(),
                                      itemCount: mineBetHisViewModel
                                          .mineBetHisModelData!.data!.length,
                                      itemBuilder: (context, index) {
                                        final res = mineBetHisViewModel
                                            .mineBetHisModelData!.data![index];
                                        return Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: Container(
                                                height: height * 0.05,
                                                width: width,
                                                decoration: BoxDecoration(
                                                  color: const Color(0xff394c54),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    SizedBox(
                                                      width: width * 0.25,
                                                      child: Center(
                                                        child: Text(
                                                          res.createdAt
                                                              .toString(),
                                                          style: const TextStyle(
                                                            fontSize: 10,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: width * 0.15,
                                                      child: Center(
                                                        child: Text(
                                                          "${res.amount}Rs",
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            color: res.winAmount!=0
                                                                ? Colors.green
                                                                : Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: width * 0.2,
                                                      child: Center(
                                                        child: Text(
                                                          "${res.winAmount!.toStringAsFixed(2)}Rs",
                                                          style: const TextStyle(
                                                            fontSize: 12,
                                                            // color: int.parse(res
                                                            //             .winAmount
                                                            //             .toString()) >
                                                            //         int.parse(res
                                                            //             .winAmount
                                                            //             .toString())
                                                            //     ? Colors.green
                                                            //     : Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: width * 0.2,
                                                      child: Center(
                                                        child: Text(
                                                          "${res.multiplier}x",
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            color:res.winAmount!=0
                                                                ? Colors.green
                                                                : Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      }),
                                ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NoDataAvailable extends StatelessWidget {
  const NoDataAvailable({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: height * 0.05,
        ),
        Image.asset(
          Assets.minesNoDataAvailable,
          height: height * 0.21,
        ),
        const Text(
          "No data (:",
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
