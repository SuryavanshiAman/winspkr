// import 'dart:async';
// import 'dart:convert';
// import 'dart:math';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:wins_pkr/Aviator/aviator_model/my_bet_model.dart';
// import 'package:wins_pkr/view/aviator/res/mine_api_url.dart';
// import 'package:wins_pkr/view_modal/user_view_modal.dart';
//
//
// class AllBets {
//   String? username;
//   String? bet;
//   String? win;
//   AllBets(this.username, this.bet, this.win);
// }
//
// class MyBetPage extends StatefulWidget {
//   const MyBetPage({super.key});
//
//   @override
//   State<MyBetPage> createState() => _MyBetPageState();
// }
//
// class _MyBetPageState extends State<MyBetPage> {
//
//   Color _currentColor = Colors.black;
//
//   List<MyBetModel> bets = [];
//
//   @override
//   void initState() {
//     myBet();
//     Timer.periodic(const Duration(seconds: 1), (timer) {
//
//         _currentColor = Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0).withOpacity(1.0);
//     });
//     super.initState();
//
//   }
//
//   double height = 150;
//   double width = 300;
//   @override
//   Widget build(BuildContext context) {
//     if (responseStatusCode == 400) {
//       return const SizedBox(
//         height: 100,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Icon(
//               Icons.calendar_month_outlined,
//               size: 50,
//               color: Colors.grey,
//             ),
//             Text('No Data Found Today',
//                 style: TextStyle(
//                     color: Colors.grey,
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold)),
//           ],
//         ),
//       );
//     } else {
//       return Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Container(
//                     alignment: Alignment.centerLeft,
//                     width: width * 0.3,
//                     child: const Text("Game S.No",
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 12,
//                             fontWeight: FontWeight.bold)),
//                   ),
//                   Container(
//                     alignment: Alignment.center,
//                     width: width * 0.3,
//                     child: const Text("Bet, INR X",
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 12,
//                             fontWeight: FontWeight.bold)),
//                   ),
//                   Container(
//                     alignment: Alignment.centerRight,
//                     width: width * 0.3,
//                     child: const Text("Win, INR",
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 12,
//                             fontWeight: FontWeight.bold)),
//                   ),
//                 ],
//               ),
//             ),
//             ListView.builder(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 itemCount: bets.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return Padding(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 5.0, vertical: 2),
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(horizontal: 5.0),
//                       decoration: BoxDecoration(
//                           color: bets[index].multiplier=='null'?Colors.black:const Color(0xff123304),
//                           border: Border.all(color: bets[index].multiplier=='null'?Colors.white60:const Color(0xff406b1f)),
//                           borderRadius: const BorderRadius.all(Radius.circular(10))),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Container(
//                             height: 25,
//                               alignment: Alignment.centerLeft,
//                               width: width * 0.3,
//                               child:Text('2024${bets[index].gameSrNum}',
//                                   maxLines: 1,
//                                   // bets[index].datetime==null?'not added':DateFormat("E, HH:MM,a").format(
//                                   // DateTime.parse(bets[index].datetime.toString())),
//                                   style: const TextStyle(
//                                       color: Colors.white, fontSize: 12)
//                               ),),
//                           Container(
//                             height: 25,
//                               alignment: Alignment.center,
//                               width: width * 0.3,
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Text(bets[index].multiplier=='null'?'${bets[index].amount}':'${bets[index].amount} , ',
//                                       style: const TextStyle(
//                                           color: Colors.white, fontSize: 12)),
//                                   SizedBox(
//                                     height: 22,
//                                     width: 35,
//                                     child: Center(
//                                       child: Text(bets[index].multiplier=='null'?'':'${bets[index].multiplier}',
//                                           style:  TextStyle(
//                                               color: _currentColor, fontSize: 12)),
//                                     ),
//                                   ),
//                                 ],
//                               )),
//
//                           Container(
//                               height: 25,
//                               alignment: Alignment.centerRight,
//                               width: width * 0.3,
//                               child: Text(bets[index].cashoutAmount =="null"?'Rs 0.0':
//                               'Rs ${bets[index].cashoutAmount}',
//                                   style: const TextStyle(
//                                       color: Colors.white, fontSize: 12))),
//                         ],
//                       ),
//                     ),
//                   );
//                 })
//           ],
//         ),
//       );
//     }
//   }
//
//   int? responseStatusCode;
//
//
//   Future<void> myBet() async {
//     print("Ajay");
//     UserViewModel userProvider = UserViewModel();
//     String? userid =await userProvider.getUser();
//      final url = "${AviatorApiUrl.aviatorBetHistory}$userid";
//     try {
//       final response = await http.get(Uri.parse(url));
//
//       setState(() {
//         responseStatusCode = response.statusCode;
//       });
//       // print('dsbhjkcvbn${response.statusCode}');
//       if (response.statusCode == 200) {
//         final Map<String, dynamic> responseData = json.decode(response.body);
//         print('dsbhjkcvbn$responseData');
//         setState(() {
//           bets = (responseData['data'] as List<dynamic>)
//               .map((item) => MyBetModel.fromJson(item))
//               .toList();
//         });
//         print('DDDDDDDDD$bets');
//       } else if (response.statusCode == 400) {
//         if (kDebugMode) {
//           print('Data not found');
//         }
//       } else {
//         setState(() {
//           bets = [];
//         });
//         throw Exception('Failed to load data');
//       }
//     } catch (e) {
//       setState(() {
//         bets = [];
//       });
//     }
//   }
// }
