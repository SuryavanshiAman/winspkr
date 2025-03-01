// import 'dart:convert';
//
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
// import 'package:wins_pkr/main.dart';
// import 'package:wins_pkr/model/plinko_result.dart';
// import 'package:wins_pkr/model/user_model.dart';
// import 'package:wins_pkr/res/aap_colors.dart';
// import 'package:wins_pkr/res/api_urls.dart';
// import 'package:wins_pkr/res/provider/user_view_provider.dart';
// import 'package:http/http.dart' as http;
//
//
// class PlinkoHowToPlayPage extends StatefulWidget {
//   @override
//   State<PlinkoHowToPlayPage> createState() => _PlinkoHowToPlayPageState();
// }
//
//
// class _PlinkoHowToPlayPageState extends State<PlinkoHowToPlayPage> {
//
//   @override
//   void initState() {
//     super.initState();
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return  Material(
//       color: Colors.transparent,
//       child: Center(
//         child: Container(
//           height: height*0.7,
//           width: width,
//           color:Color(0xff495b65),
//           child: Center(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: ListView(
//                 shrinkWrap: true,
//                 physics: NeverScrollableScrollPhysics(),
//                 children: [
//                   Row(
//                     children: [
//                       SizedBox(
//                         width: width*0.05,
//                       ),
//                       Text('How To Play',
//                         style: TextStyle(
//                           fontSize: 18,
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(
//                         width: width*0.45,
//                       ),
//                       IconButton(
//                         onPressed: (){
//                           Navigator.pop(context);
//                         },
//                         icon: Icon(Icons.cancel_outlined,color: Colors.white,),
//                       ),
//                     ],
//                   ),
//                   Divider(
//                     color: Colors.white,
//                   ),
//                   Container(
//                     height:responseStatuscode == 400? height * 0.1:height * 0.4,
//                     width: width,
//                     color: AppColors.scaffolddark,
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: SingleChildScrollView(
//                         child:  responseStatuscode == 400
//                             ? const HtmlWidget(
//                           '''
//                   <div style="color: white; text-align: center;">
//                     <p>No data found.</p>
//                   </div>
//                   ''',
//                         )
//                             : description == null
//                             ? Center(child: const CircularProgressIndicator())
//                             : HtmlWidget(description.toString(),textStyle: TextStyle(color: Colors.white),),
//                       ),),
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
//   int? responseStatuscode;
//
//   var description;
//   howToPlay() async {
//     print("fdfuya");
//     print("chla");
//     final type = widget.type.toString();
//     final response = await http.get(
//       Uri.parse("${ApiUrl.aboutus}type=$type"),
//
//     );
//
//     if (response.statusCode == 200) {
//       final responseData = json.decode(response.body)['data'][0];
//       print(responseData);
//       setState(() {
//         description = responseData["description"].toString();
//         print(description);
//         print("description");
//       });
//
//
//
//     }
//     else {
//       print("Failed to load data. Status code: ${response.statusCode}");
//     }
//   }
//
//
//   // int? responseStatuscode;
//   //
//   //
//   // UserViewProvider userProvider = UserViewProvider();
//   //
//   // List<PlinkoBetHistory> fetchPlinkoBetTwo = [];
//   // Future<void> fetchPlinkoBethistoryTwo() async {
//   //   UserModel user = await userProvider.getUser();
//   //   String token = user.id.toString();
//   //   final response = await http.get(
//   //     Uri.parse("${ApiUrl.plinkoBetHistory}userid=$token"),
//   //   );
//   //   print("${ApiUrl.plinkoBetHistory}userid=$token");
//   //
//   //
//   //   setState(() {
//   //     responseStatuscode = response.statusCode;
//   //   });
//   //
//   //   if (response.statusCode == 200) {
//   //     final List<dynamic> responseData = json.decode(response.body)['data'];
//   //     setState(() {
//   //       fetchPlinkoBetTwo = responseData
//   //           .map((item) => PlinkoBetHistory.fromJson(item))
//   //           .toList();
//   //     });
//   //   } else if (response.statusCode == 400) {
//   //     if (kDebugMode) {
//   //       print('Data not found');
//   //     }
//   //   } else {
//   //     setState(() {
//   //       fetchPlinkoBetTwo = [];
//   //     });
//   //     throw Exception('Failed to load data');
//   //   }
//   // }
// }
//
//
