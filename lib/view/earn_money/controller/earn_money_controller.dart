import 'package:flutter/material.dart';

class EarnMoneyController with ChangeNotifier {
  int _tabIndex = 0;

  int get tabIndex => _tabIndex;

  void setTabIndex(int index) {
    _tabIndex = index;
    notifyListeners();
  }

  List<TabDataModel> tabDataList = [
    TabDataModel(icon: Icons.info, title: 'About'),
    TabDataModel(icon: Icons.history, title: 'History'),
    TabDataModel(icon: Icons.card_giftcard, title: 'Gift'),
    // TabDataModel(icon: Icons.calendar_today, title: 'Daily'),
    // TabDataModel(icon: Icons.qr_code_2_outlined, title: 'Earn'),
  ];

  List<PeopleEarnModel> peopleEarnList = [
    PeopleEarnModel(
        title: 'v13', subtitle: 'Rs160,000,000', amount: '377', bet: "1.5"),
    PeopleEarnModel(
        title: 'v12', subtitle: 'Rs85,000,000', amount: '233', bet: "1.4"),
    PeopleEarnModel(
        title: 'v11', subtitle: 'Rs50,000,000', amount: '144', bet: "1.3"),
    PeopleEarnModel(
        title: 'v10', subtitle: 'Rs26,000,000', amount: '89', bet: "1.2"),
    PeopleEarnModel(
        title: 'v9', subtitle: 'Rs14,000,000', amount: '55', bet: "1.1"),
    PeopleEarnModel(
        title: 'v8', subtitle: 'Rs7,500,000', amount: '34', bet: "1.0"),
    PeopleEarnModel(
        title: 'v7', subtitle: 'Rs4,200,000', amount: '21', bet: "0.9"),
    PeopleEarnModel(
        title: 'v6', subtitle: 'Rs2,000,000', amount: '13', bet: "0.8"),
    PeopleEarnModel(
        title: 'v5', subtitle: 'Rs1,000,000', amount: '8', bet: "0.7"),
    PeopleEarnModel(title: 'v4', subtitle: 'Rs350,000', amount: '5', bet: "0.6"),
    PeopleEarnModel(title: 'v3', subtitle: 'Rs140,000', amount: '3', bet: "0.5"),
    PeopleEarnModel(title: 'v2', subtitle: 'Rs5,000', amount: '2', bet: "0.4"),
    PeopleEarnModel(title: 'v1', subtitle: 'Rs2,000', amount: '1', bet: "0.3"),
  ];

  List<String> aboutRuleList = [
    'Active users: daily bet amount 2000',
    'Your reward will be calculated based on the total bet amount of your members. The reward gained can either be withdrawn or used for further betting.',
    'Refer as many friends as you can to gain bigger percentage of rebates.',
    'Earn lifetime revenue on your referred players.',
  ];

 List<LevelThreeModel> levelThreeList = [
   LevelThreeModel(title: '1', subtitle: '0.1'),
   LevelThreeModel(title: '2', subtitle: '0.2'),
   LevelThreeModel(title: '3', subtitle: '0.3'),
   LevelThreeModel(title: '4', subtitle: '0.4'),
   LevelThreeModel(title: '5', subtitle: '0.5'),
   LevelThreeModel(title: '6', subtitle: '0.6'),
   LevelThreeModel(title: '7', subtitle: '0.7'),
   LevelThreeModel(title: '8', subtitle: '0.8'),
   LevelThreeModel(title: '9', subtitle: '0.9'),
   LevelThreeModel(title: '10', subtitle: '1.0'),
   LevelThreeModel(title: '11', subtitle: '1.1'),
   LevelThreeModel(title: '12', subtitle: '1.2'),
];
}

class TabDataModel {
  final IconData icon;
  final String title;

  TabDataModel({required this.icon, required this.title});
}

class PeopleEarnModel {
  final String title;
  final String subtitle;
  final String amount;
  final String bet;

  PeopleEarnModel({
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.bet,
  });
}


class LevelThreeModel {
  final String title;
  final String subtitle;
  LevelThreeModel({required this.title, required this.subtitle});
}