// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
//
//
// // var wallet;
// class AviatorWallet with ChangeNotifier {
//   double _fixedbalance=0;
//   double _balance=0;
//   double get fixed => _fixedbalance;
//   double get balance => _balance;
//
//
//
//   void updateBal(double value) {
//     _balance = _fixedbalance-value;
//     notifyListeners();
//   }
//
//
//   wallet() async {
//     //get id
//     UserViewProvider userProvider = UserViewProvider();
//     UserModel user = await userProvider.getUser();
//     String token = user.id.toString();
//     try {
//       final response = await http.get(Uri.parse(ApiUrl.profile + token))
//           .timeout(const Duration(seconds: 10));
//
//       if (response.statusCode == 200) {
//         final jsonMap = json.decode(response.body);
//         _fixedbalance=double.parse(jsonMap['total_wallet'].toString());
//         _balance=_fixedbalance;
//         return UserProfile.fromJson(jsonMap);
//
//       } else if (response.statusCode == 401) {
//         return null;
//       } else {
//         throw Exception('Failed to load user data');
//       }
//     } on SocketException {
//       throw Exception('No Internet connection');
//     }
//   }
// }