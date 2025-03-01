import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wins_pkr/view/mines/controller/mine_controller.dart';

class SelectBetAmount extends StatelessWidget {
  const SelectBetAmount({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MineController>(builder: (context, mic, child) {
      return Dialog(
        child: Container(
          height: 270,
          width: 300,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF117ea7),
                Color(0xFF19a99f),
                Color(0xFF117ea7),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'Bet',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 15),
              ),
              Container(
                  height: 240,
                  width: 300,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF117ea7),
                        Color(0xFF19a99f),
                        Color(0xFF117ea7),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                  child: GridView.builder(
                      padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 15,
                          childAspectRatio: 3.5),
                      itemCount: mic.betAmountList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            mic.setSelectedBet(index);
                            Navigator.pop(context);
                          },
                          child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: mic.selectedBet == index
                                      ? const Color(0xFF017c80)
                                      : const Color(0xFF006366),
                                  border: Border.all(
                                      color: mic.selectedBet == index
                                          ? Colors.white
                                          : Colors.black),
                                  borderRadius: BorderRadius.circular(50)),
                              child: Text(mic.betAmountList[index].toString(),
                                  style: const TextStyle(
                                    fontSize: 11,
                                    color: Colors.white,
                                  ))),
                        );
                      })),
            ],
          ),
        ),
      );
    });
  }
}