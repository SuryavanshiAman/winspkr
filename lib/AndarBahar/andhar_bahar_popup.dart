// import 'dart:convert';
// import 'package:wins_pkr/constant_pages/constant_color.dart';
// import 'package:wins_pkr/constant_pages/no_found_data.dart';
// import 'package:wins_pkr/game_modal/wingo_betting_history.dart';
// import 'package:wins_pkr/main.dart';
// import 'package:wins_pkr/res/api_urls.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
//
//
// class AndharBaharPopUpPage extends StatefulWidget {
//   final String gameId;
//   const AndharBaharPopUpPage({super.key, required this.gameId});
//
//   @override
//   State<AndharBaharPopUpPage> createState() => _AndharBaharPopUpPageState();
// }
//
// class _AndharBaharPopUpPageState extends State<AndharBaharPopUpPage> {
//
//   @override
//   void initState() {
//     super.initState();
//     gameHistory();
//   }
//
//   int limitResult = 0;
//   int pageNumber = 1;
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: Colors.transparent,
//       child: Center(
//         child: Container(
//           height: height * 0.8,
//           width: width,
//           color: const Color(0xff495b65),
//           child: Center(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: ListView(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const Text(
//                         'GAME HISTORY',
//                         style: TextStyle(
//                           fontSize: 18,
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       IconButton(
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                         icon: const Icon(
//                           Icons.cancel_outlined,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const Divider(
//                     color: Colors.white,
//                   ),
//                   SizedBox(
//                     height: height,
//                     width: width,
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [
//                               SizedBox(
//                                 width: width * 0.25,
//                                 child: const Center(
//                                   child: Text(
//                                     'Time',
//                                     style: TextStyle(
//                                       fontSize: 15,
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: width * 0.15,
//                                 child: const Center(
//                                   child: Text(
//                                     'Bet',
//                                     style: TextStyle(
//                                       fontSize: 15,
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: width * 0.2,
//                                 child: const Center(
//                                   child: Text(
//                                     'Amount',
//                                     style: TextStyle(
//                                       fontSize: 15,
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: width * 0.18,
//                                 child: const Text(
//                                   'Win/loss',
//                                   style: TextStyle(
//                                     fontSize: 15,
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const Divider(
//                             color: Colors.white,
//                           ),
//                           responseStatusCode == 400
//                               ? const NoFoundData()
//                               : itemsDataHistory.isEmpty
//                                   ? const Center(
//                                       child: CircularProgressIndicator())
//                                   : SizedBox(
//                                       height: height * 0.55,
//                                       child: ListView.builder(
//                                           shrinkWrap: true,
//                                           physics: const ScrollPhysics(),
//                                           itemCount: itemsDataHistory.length,
//                                           itemBuilder: (context, index) {
//                                             return Column(
//                                               children: [
//                                                 Padding(
//                                                   padding: const EdgeInsets.all(2.0),
//                                                   child: Container(
//                                                     height: height * 0.05,
//                                                     width: width,
//                                                     decoration: BoxDecoration(
//                                                       color: const Color(0xff394c54),
//                                                       borderRadius: BorderRadius.circular(5),
//                                                     ),
//                                                     child: Row(
//                                                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                                       children: [
//                                                         SizedBox(
//                                                           width: width * 0.25,
//                                                           child: Center(
//                                                             child: Text(
//                                                               itemsDataHistory[
//                                                                       index]
//                                                                   .updatedAt
//                                                                   .toString(),
//                                                               style:
//                                                                   const TextStyle(
//                                                                 fontSize: 10,
//                                                                 color: Colors
//                                                                     .white,
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .bold,
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                         SizedBox(
//                                                           width: width * 0.15,
//                                                           child: Center(
//                                                             child: Text(
//                                                               "${itemsDataHistory[index].amount}.00Rs",
//                                                               style: TextStyle(
//                                                                 fontSize: 12,
//                                                                 color: int.parse(itemsDataHistory[index]
//                                                                             .winAmount
//                                                                             .toString()) >
//                                                                         int.parse(itemsDataHistory[index]
//                                                                             .amount
//                                                                             .toString())
//                                                                     ? Colors
//                                                                         .green
//                                                                     : Colors
//                                                                         .white,
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .bold,
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                         SizedBox(
//                                                           width: width * 0.2,
//                                                           child: Center(
//                                                             child: Text(
//                                                               "+${itemsDataHistory[index].winAmount}.00Rs",
//                                                               style: TextStyle(
//                                                                 fontSize: 12,
//                                                                 color: int.parse(itemsDataHistory[index]
//                                                                             .winAmount
//                                                                             .toString()) >
//                                                                         int.parse(itemsDataHistory[index]
//                                                                             .amount
//                                                                             .toString())
//                                                                     ? Colors
//                                                                         .green
//                                                                     : Colors
//                                                                         .white,
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .bold,
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                         SizedBox(
//                                                           width: width * 0.18,
//                                                           child: Center(
//                                                             child: Text(
//                                                               itemsDataHistory[index].status==0?'Pending':
//                                                               itemsDataHistory[index].status==1?'Win':'Lose',
//                                                               style: TextStyle(
//                                                                 fontSize: 12,
//                                                                 color: int.parse(itemsDataHistory[index]
//                                                                             .winAmount
//                                                                             .toString()) >
//                                                                         int.parse(itemsDataHistory[index]
//                                                                             .amount
//                                                                             .toString())
//                                                                     ? Colors
//                                                                         .green
//                                                                     : Colors
//                                                                         .white,
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .bold,
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ],
//                                             );
//                                           }),
//                                     ),
//                           SizedBox(
//                             height: height * 0.01,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               GestureDetector(
//                                 onTap: limitResult == 0
//                                     ? () {}
//                                     : () {
//                                         setState(() {
//                                           pageNumber--;
//                                           limitResult = limitResult - 10;
//                                           offsetResult = offsetResult - 10;
//                                         });
//                                         setState(() {});
//                                         gameHistory();
//                                       },
//                                 child: Container(
//                                   height: height * 0.06,
//                                   width: width * 0.10,
//                                   decoration: BoxDecoration(
//                                     color: const Color(0xff394c54),
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   child: const Icon(
//                                     Icons.navigate_before,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               ),
//                               const SizedBox(width: 16),
//                               Text(
//                                 '$pageNumber/${itemsDataHistory.length}',
//                                 style: const TextStyle(fontSize: 13,
//                                   fontWeight: FontWeight.w600,
//                                   color: AppColor.primaryTextColor,),
//                                 maxLines: 1,
//                               ),
//                               const SizedBox(width: 16),
//                               GestureDetector(
//                                 onTap: () {
//                                   setState(() {
//                                     limitResult = limitResult + 10;
//                                     offsetResult = offsetResult + 10;
//                                     pageNumber++;
//                                   });
//                                   setState(() {});
//                                   gameHistory();
//                                 },
//                                 child: Container(
//                                   height: height * 0.06,
//                                   width: width * 0.10,
//                                   decoration: BoxDecoration(
//                                     color: const Color(0xff394c54),
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   child: const Icon(Icons.navigate_next,
//                                       color: Colors.white),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   ///
//
//   int offsetResult = 0;
//
//   int? responseStatusCode;
//   List<BettingHistoryModel> itemsDataHistory = [];
//   Future<void> gameHistory() async {
//     final prefs = await SharedPreferences.getInstance();
//     final userId = prefs.getInt("userId");
//     final response = await http.get(Uri.parse("${ApiUrl.gameHistory}${widget.gameId}&userid=$userId"));
//     setState(() {
//       responseStatusCode = response.statusCode;
//     });
//     if (response.statusCode == 200) {
//       final List<dynamic> responseData = json.decode(response.body)['data'];
//       setState(() {
//         itemsDataHistory = responseData.map((item) => BettingHistoryModel.fromJson(item)).toList();
//       });
//       if (kDebugMode) {
//         print(responseData);
//         print("${ApiUrl.gameHistory}${widget.gameId}&userid=$userId");
//         print('swherwe789;');
//
//       }
//
//     } else if (response.statusCode == 400) {
//
//     } else {
//       setState(() {
//         itemsDataHistory = [];
//       });
//       throw Exception('Failed to load data');
//     }
//   }
//
// }
//
