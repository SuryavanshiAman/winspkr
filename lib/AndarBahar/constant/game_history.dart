import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wins_pkr/AndarBahar/andarBaharModel/bet_history_con.dart';
import 'package:wins_pkr/constants/app_colors.dart';
import 'package:wins_pkr/main.dart';
import 'package:wins_pkr/res/api_urls.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;




class GameHistoryPage extends StatefulWidget {
  final String gameId;
  const GameHistoryPage({super.key,  required this.gameId});

  @override
  GameHistoryPageState createState() => GameHistoryPageState();
}

class GameHistoryPageState extends State<GameHistoryPage> {
  @override
  void initState() {
    gameHistory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child:  Align(
          alignment: Alignment.center,
          child: SizedBox(
            height: height*0.8,
            width: width*0.8,
            // decoration: BoxDecoration(
            //     image: DecorationImage(
            //         image: AssetImage(RedBlackAssets.redvsblackBgPicture1),
            //         fit: BoxFit.fill)),
            child:  Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        height: 20,
                        width: 40,

                      ),
                      const Text(
                        'MY HISTORY',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            color: Colors.white),
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child:  const SizedBox(
                          height: 20,
                          width: 60,
                          //  color: Colors.grey,
                          child: Center(child: Icon(Icons.close,size: 25,color: Colors.white,weight: 40,)),
                        ),
                      ),
                    ],
                  ),
                ),
                responseStatusCode == 400
                    ? const Center(child: NotFoundData())
                    : itemsData.isEmpty
                    ? const Center(child: CircularProgressIndicator())
                    :                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: ListView.builder(
                      itemCount: itemsData.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 4.0, left: 8, right: 8),
                          child: Container(
                            decoration: BoxDecoration(
                                border:
                                Border.all(color: AppColors.textColor4),
                                color: Colors.black.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(10)),
                            height: 100,
                            child:  Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                       const Text(
                                        'Amount',
                                        style: TextStyle(
                                          color: AppColors.textColor1,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        'Rs${itemsData[index].amount}',
                                        style:  const TextStyle(
                                          color: AppColors.textColor2,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                       const Text(
                                        'Win Amount',
                                        style: TextStyle(
                                          color: AppColors.textColor1,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        '${itemsData[index].winAmount}',
                                        style:  const TextStyle(
                                          color: AppColors.textColor2,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // Padding(
                                //   padding:
                                //   const EdgeInsets.symmetric(horizontal: 8.0),
                                //   child: Row(
                                //     mainAxisAlignment:
                                //     MainAxisAlignment.spaceBetween,
                                //     children: [
                                //       const Text(
                                //         'Win Number',
                                //         style: TextStyle(
                                //           color: AppColor.textColor1,
                                //           fontSize: 10,
                                //           fontWeight: FontWeight.bold,
                                //         ),
                                //       ),
                                //       CircleAvatar(
                                //         radius: height / 55,
                                //         backgroundImage: AssetImage(itemsData[
                                //         index]
                                //             .number ==
                                //             1
                                //             ? AppAssets.imageIcDtD
                                //             : itemsData[index].number == 2
                                //             ? AppAssets.imageIcDtT
                                //             : AppAssets.backgroundIcDtTie),
                                //       ),
                                //
                                //     ],
                                //   ),
                                // ),
                                Padding(
                                  padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                       const Text(
                                        'Status',
                                        style: TextStyle(
                                          color: AppColors.textColor1,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        itemsData[index].status=='0'?'Lose':
                                        itemsData[index].status=='1'?'Pending':'Win',
                                        style:  TextStyle(
                                          color: itemsData[index].status=='0'?Colors.red:itemsData[index].status=='1'?Colors.orange:Colors.green,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                       const Text(
                                        'Date',
                                        style: TextStyle(
                                          color: AppColors.textColor1,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        DateFormat("dd/MM/yyyy,HH:mm a")
                                            .format(DateTime.parse(
                                          itemsData[index]
                                              .updatedAt
                                              .toString(),
                                        )),
                                        style:  const TextStyle(
                                          color: AppColors.textColor1,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                       const Text(
                                        'Game S.no',
                                        style: TextStyle(
                                          color: AppColors.textColor1,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(itemsData[index].gameNo.toString(),
                                        style:  const TextStyle(
                                          color: AppColors.textColor1,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                       const Text(
                                        'Date',
                                        style: TextStyle(
                                          color: AppColors.textColor1,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        DateFormat("dd/MM/yyyy,HH:mm a")
                                            .format(DateTime.parse(
                                          itemsData[index]
                                              .updatedAt
                                              .toString(),
                                        )),
                                        style:  const TextStyle(
                                          color: AppColors.textColor1,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

              ],
            ),
          ),
        )

    );
  }
  int? responseStatusCode;
  List<BetHistoryCon> itemsData = [];
  Future<void> gameHistory() async {
    var gameIds = widget.gameId;
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getInt("userId").toString();

    final response = await http.get(Uri.parse("${ApiUrl.gameHistory}$gameIds&userid=$userId"));
    setState(() {
      responseStatusCode = response.statusCode;
    });
    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body)['data'];
      setState(() {
        itemsData = responseData.map((item) => BetHistoryCon.fromJson(item)).toList();
      });
    } else if (response.statusCode == 400) {

    } else {
      setState(() {
        itemsData = [];
      });
      throw Exception('Failed to load data');
    }
  }
}
class NotFoundData extends StatelessWidget {
  const NotFoundData({super.key});
  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.calendar_month_sharp, size: 120, color: Colors.white),
        Text(
          "Data not found",
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
