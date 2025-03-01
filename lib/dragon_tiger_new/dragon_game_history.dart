import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wins_pkr/constants/app_button.dart';
import 'package:wins_pkr/constants/app_colors.dart';
import 'package:wins_pkr/constants/gradient_app_bar.dart';
import 'package:wins_pkr/dragon_tiger_new/model/betting_history_model.dart';
import 'package:wins_pkr/generated/assets.dart';
import 'package:wins_pkr/main.dart';
import 'package:wins_pkr/res/api_urls.dart';
import 'package:wins_pkr/view_modal/user_view_modal.dart';


class DragonTigerHistory extends StatefulWidget {
  final String gameid;
  const DragonTigerHistory({super.key,required this.gameid});

  @override
  State<DragonTigerHistory> createState() => _DragonTigerHistoryState();
}

class _DragonTigerHistoryState extends State<DragonTigerHistory> {


  @override
  void initState() {
    gameHistory();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldDark,
      appBar: const GradientAppBar(
        elevation: 10,
        leading: AppBackBtn(),
        centerTitle: true,
        title: Text(
          'Dragon Tiger',
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: AppColors.whiteColor),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration:  const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.imagesAppBg),
            fit: BoxFit.fill,
          ),
        ),
        child: ListView(
          shrinkWrap: true,
          children: [
            responseStatusCode == 400
                ?  Container()
                : itemsDataHistory.isEmpty
                ? const Center(child: CircularProgressIndicator()):
            ListView.builder(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10),
              physics:
              const ScrollPhysics(),
              shrinkWrap: true,
              itemCount: itemsDataHistory.length,
              itemBuilder: (context, index) {
                final items = itemsDataHistory[index];
                List<Color> colors;

                if (items.number ==
                    1) {
                  colors = [
                    const Color(0xFF56d5e5),
                    const Color(0xFF56d5e5),
                  ];
                } else if (items
                    .number ==
                    2) {
                  colors = [
                    Colors.red,
                    Colors.red
                  ];
                }
                else {
                  colors = [
                    Colors.green,
                    Colors.green
                  ];
                }
                return ExpansionTile(
                  // shape: Border.all(color: Colors.transparent),
                  leading: Container(
                      height: height * 0.06,
                      width: width * 0.12,
                      decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(10),
                          // color: Colors.grey
                          gradient: LinearGradient(
                              stops: const [
                                0.5,
                                0.5
                              ],
                              colors:colors,
                              begin: Alignment.topLeft,
                              end: Alignment
                                  .bottomRight)),
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Image.asset(
                          // 1 dragon
                          // 2 tiger

                          items.number == 1
                              ? Assets.dragontigerIcDtD
                              : items.number == 2
                              ? Assets.dragontigerIcDtT:
                          Assets.dragontigerIcDtTie,
                        ),
                      )
                  ),
                  title:  Text(
                    items.gamesNo.toString(),
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  ),
                  subtitle:  Text(
                      items.createdAt.toString(),
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: Colors.grey)),
                  trailing: Column(
                    mainAxisAlignment:
                    MainAxisAlignment.end,
                    children: [
                      Container(
                        height: height * 0.042,
                        width: width * 0.2,
                        decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.circular(
                                10),
                            border: Border.all(
                                color: items.status==0? AppColors.primaryTextColor:items.status==2?
                                AppColors
                                    .secondaryTextColor: Colors.green)),
                        child: Center(
                          child:  Text(
                            items.status==2?'Failed':items.status==0?'Pending':'Succeed',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight:
                                FontWeight.w700,
                                color:
                                items.status==0?Colors.white:
                                items.status==2?
                                AppColors
                                    .secondaryTextColor: Colors.green),
                          ),
                        ),
                      ),
                      Text(
                        items.status==0?'--':
                        items.status==2?'- Rs${items.amount.toStringAsFixed(2)}':'+ Rs${items.winAmount.toStringAsFixed(2)}',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight:
                            FontWeight.w700,
                            color: items.status==0?Colors.white:items.status==2?
                            AppColors
                                .secondaryTextColor: Colors.green),
                      ),
                    ],
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        mainAxisAlignment:
                        MainAxisAlignment.start,
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          const Align(
                              alignment:
                              Alignment.topLeft,
                              child: Text(
                                'Details',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight:
                                    FontWeight
                                        .w900,
                                    color:
                                    Colors.white),
                              )),
                          const SizedBox(height: 8.0),
                          Container(
                            height: height * 0.08,
                            width: width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.lightMarron),
                            child: Padding(
                              padding:
                              const EdgeInsets
                                  .all(8.0),
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment
                                    .start,
                                crossAxisAlignment:
                                CrossAxisAlignment
                                    .start,
                                children: [
                                  const Text(
                                    'order number',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight:
                                        FontWeight
                                            .w700,
                                        color: Colors
                                            .white),
                                  ),
                                  const SizedBox(
                                      height: 4.0),
                                  Text(
                                    items.orderId.toString(),
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight:
                                        FontWeight
                                            .w700,
                                        color: Colors
                                            .white),
                                  )
                                ],
                              ),
                            ),
                          ),
                          historyDetails(
                              'Period',
                              items.gamesNo.toString(),
                              Colors.white),
                          historyDetails(
                              'Purchase amount',
                              items.amount.toString(),
                              Colors.white),
                          historyDetails(
                              'Amount after tax',
                              items.tradeAmount.toString(),
                              Colors.red),
                          historyDetails('Tax',
                              items.commission.toString(), Colors.white),
                          historyWinDetails(
                              'Result',
                              items.winNumber==null? '--': '${items.winNumber}, ',

                              items.winNumber==1?"Dragon": items.winNumber==2?"Tiger":"Tie",

                              Colors.white,

                              items.winNumber==1?const Color(0xff56d5e5):
                              items.winNumber==2?Colors.red:Colors.green

                          ),
                          historyDetails('Select',
                              items.number==1?'Dragon':items.number==2?'Tiger':"Tie",
                              Colors.white
                          ),
                          historyDetails('Status',
                              items.status==0?'Unpaid':
                              items.status==2?
                              'Failed':'Succeed', items.status==0?Colors.white:items.status==2?Colors.red:Colors.green),
                          historyDetails('Win/Loss',
                              items.status==0?'--': 'Rs${items.winAmount.toStringAsFixed(2)}', items.status==0?Colors.white:items.status==2? Colors.red:Colors.green),
                          historyDetails(
                              'Order time',
                              items.createdAt.toString(),
                              Colors.white),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: limitResult == 0
                      ? () {}
                      : () {
                    setState(() {
                      pageNumber--;
                      limitResult = limitResult - 10;
                      offsetResult = offsetResult - 10;
                    });
                    setState(() {});
                    gameHistory();
                  },
                  child: Container(
                    height: height * 0.06,
                    width: width * 0.10,
                    decoration: BoxDecoration(
                      color: AppColors.lightMarron,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.navigate_before,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                 '$pageNumber/${itemsDataHistory.length}',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryTextColor,
                  ),
                  maxLines: 1,
                ),
                const SizedBox(width: 16),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      limitResult = limitResult + 10;
                      offsetResult = offsetResult + 10;
                      pageNumber++;
                    });
                    setState(() {});
                    gameHistory();
                  },
                  child: Container(
                    height: height * 0.06,
                    width: width * 0.10,
                    decoration: BoxDecoration(
                      color: AppColors.lightMarron,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.navigate_next,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

    );
  }
  int limitResult = 0;
  int pageNumber = 1;
  historyDetails(String title, String subtitle, Color subColor) {
    return Column(
      children: [
        const SizedBox(height: 8.0),
        Container(
          height: height * 0.05,
          width: width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.lightMarron),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: subColor),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  historyWinDetails(String title, String subtitle, String subtitle1,
      Color subColor, Color subColor1) {
    return Column(
      children: [
        const SizedBox(height: 8.0),
        Container(
          height: height * 0.05,
          width: width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.lightMarron),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                Row(
                  children: [
                    Text(
                      subtitle,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: subColor),
                    ),
                    Text(
                      subtitle1,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: subColor1),
                    ),

                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  int? responseStatusCode;

  int offsetResult = 0;
  List<BettingHistoryModel> itemsDataHistory = [];


  Future<void> gameHistory() async {
    try {
      // Fetch userId
      UserViewModel userViewModal = UserViewModel();
      String? userId = await userViewModal.getUser();
      // Prepare the API request
      final response = await http.post(
        Uri.parse(ApiUrl.gameHistory),
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
        },
        body: jsonEncode(<String, String>{
          "game_id": widget.gameid.toString(),
          "userid": userId ?? '',
          "limit": "10",
          // "offset": offset // Uncomment if offset is required
        }),
      );

      // Handle the response
      setState(() {
        responseStatusCode = response.statusCode;
      });

      if (response.statusCode == 200) {
        // Parse the response data
        final List<dynamic> responseData = json.decode(response.body)['data'];
        setState(() {
          itemsDataHistory = responseData
              .map((item) => BettingHistoryModel.fromJson(item))
              .toList();
        });

        if (kDebugMode) {
          print('Response Data: $responseData');
          print('API URL: ${ApiUrl.gameHistory}');
          print('Request successful.');
        }
      } else if (response.statusCode == 400) {
        // Handle specific client error
        if (kDebugMode) {
          print('Error 400: Bad Request.');
        }
      } else {
        // Handle other response errors
        setState(() {
          itemsDataHistory = [];
        });
        if (kDebugMode) {
          print('Error ${response.statusCode}: ${response.reasonPhrase}');
        }
      }
    } catch (e) {
      // Handle unexpected errors
      setState(() {
        itemsDataHistory = [];
      });
      if (kDebugMode) {
        print('Exception occurred: $e');
      }
    }
  }
}
