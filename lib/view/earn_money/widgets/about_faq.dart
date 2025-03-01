import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wins_pkr/constants/app_colors.dart';
import 'package:wins_pkr/generated/assets.dart';
import 'package:wins_pkr/main.dart';
import 'package:wins_pkr/view/earn_money/controller/earn_money_controller.dart';

class AboutFaq extends StatelessWidget {
  const AboutFaq({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<EarnMoneyController>(builder: (context, emc, child) {
      return ListView(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        children: [
          buildExpansionTile(
            stepNumber: '1.',
            title: 'How to earn commissions?',
            content: [
              buildContentText(
                'You can earn up to 1.5% of the daily wagers of players you refer. The higher your level, the higher the commission percentage you can earn.\n'
                'If your affiliate or your affiliate becomes an agent and they are at a lower level than their immediate superior, then you can receive up to 1.2% of the affiliate\'s wagering rebate amount. The commission rate depends on the level difference between you and your affiliate, the greater the level difference, the more commission you receive.',
              ),
            ],
          ),
          buildExpansionTile(
            stepNumber: '2.',
            title: 'How to invite your friends?',
            content: [
              buildContentText(
                'Share the game via social media or share the referral link to your friends.\nFriends must click on your promotion link, download the App, install the game and register to start betting to get commission.\n'
                'Registration must be completed through a referral link.',
              ),
            ],
          ),
          buildExpansionTile(
            stepNumber: '3.',
            title: 'What\'s the purpose of level?',
            content: [
              buildContentText(
                'We have divided 13 levels based on the number of recommended users and betting performance.\n'
                'Upgrade conditions require that the bet amount and team size meet the requirements at the same time. The higher your level, the higher the commission percentage you will receive from members bet amounts\n'
                'Level difference: When the immediate superior minus the corresponding direct member level is ≥ 1, there is a level difference, otherwise there is no level difference.\n'
                'The higher your level, the higher the commission percentage you get from level difference bets.',
              ),
              buildLevelDifferenceChart(),
              ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.only(bottom: 10),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: emc.levelThreeList.length,
                itemBuilder: (context, index) {
                  final res = emc.levelThreeList[index];
                  bool isEven = index % 2 == 0;
                  return Container(
                    decoration: BoxDecoration(
                      border: const Border(
                          top: BorderSide(
                              color: AppColors.whiteColor, width: 0.5)),
                      color: isEven
                          ? AppColors.lighterMaroon
                          : AppColors.lightMarron,
                      borderRadius: emc.levelThreeList.length - 1 == index
                          ? const BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            )
                          : null,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: width * 0.17,
                          child: Center(
                            child: Text(
                              res.title,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.25,
                          child: Center(
                            child: Text(
                              res.subtitle,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
          buildExpansionTile(
            stepNumber: '4.',
            title: 'How to upgrade your level?',
            content: [
              buildContentText(
                'The more members you bring to the game and the more they bet, the higher the tiers you can get.\n'
                'If you have extraordinary channel promotion capabilities, please contact our customer service center for verification.',
              ),
            ],
          ),
          buildExpansionTile(
            stepNumber: '5.',
            title: 'How to turn your friends into members?',
            content: [
              buildContentText(
                'Log in to wins_pkr, share your recommendation link with your friends on the recommendation page, guide them to register from the link, and they can become your direct members.\n'
                'Encourage your members to invite their friends to play games, and the friends they invite will become your indirect members.\n'
                'When friends of your direct members become your indirect members, they can still grow their membership this way. All their sub-members will be considered as your indirect sub-members.',
              ),
            ],
          ),
          buildExpansionTile(
            stepNumber: '6.',
            title: 'How to get commission from your members?',
            content: [
              Column(
                children: [
                  buildContentText(
                    'There must be a level difference between you and all your lower-level members, otherwise no level difference commission will be generated.\n'
                    'The proportion of commission is determined by the difference between your level and the level of your subordinate members.\n'
                    'Example:',
                  ),
                  Image.asset(Assets.imagesChart, height: height * 0.15),
                  const MyCustomTable(),
                  buildContentText(
                    'You can\'t get A\'s betting rebate\n'
                    'You can get 0.2% commission on B\'s bet amount\n'
                    'You can get 0.7% commission on C\'s bet amount',
                  ),
                ],
              ),
            ],
          ),
        ],
      );
    });
  }
}

Widget buildExpansionTile(
    {required String stepNumber,
    required String title,
    required List<Widget> content}) {
  return Theme(
    data: ThemeData(dividerColor: Colors.transparent),
    child: ExpansionTile(
      leading: Text(
        stepNumber,
        style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppColors.whiteColor),
      ),
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppColors.whiteColor),
      ),
      children: content,
    ),
  );
}

Widget buildContentText(String text) {
  List<String> segments = text.split('\n');
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: segments.map((segment) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                alignment: Alignment.center,
                height: 20,
                width: 20,
                child: const Icon(Icons.circle,
                    size: 8, color: AppColors.whiteColor)),
            const SizedBox(width: 8),
            Expanded(
                child: Text(segment,
                    style: const TextStyle(color: AppColors.whiteColor))),
          ],
        );
      }).toList(),
    ),
  );
}

Widget buildLevelDifferenceChart() {
  return Container(
    height: height * 0.05,
    decoration: const BoxDecoration(
      gradient: AppColors.appBarGradient,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10), topRight: Radius.circular(10)),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
            width: width * 0.17,
            child: const Center(
                child: Text('Level Difference',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w900)))),
        SizedBox(
            width: width * 0.25,
            child: const Center(
                child: Text('Rebate (%)',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w900)))),
      ],
    ),
  );
}

class MyCustomTable extends StatefulWidget {
  const MyCustomTable({super.key});

  @override
  State<MyCustomTable> createState() => _MyCustomTableState();
}

class _MyCustomTableState extends State<MyCustomTable> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(16.0),
        padding: const EdgeInsets.all(8.0),
        decoration: const BoxDecoration(
            // border: Border.all(color: Colors.white),
            ),
        child: Table(
          border: TableBorder.all(color: Colors.white),
          columnWidths: const <int, TableColumnWidth>{
            0: FlexColumnWidth(),
            1: FlexColumnWidth(),
            2: FlexColumnWidth(),
            3: FlexColumnWidth(),
          },
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            TableRow(
              decoration: BoxDecoration(color: Colors.grey[850]),
              children: const [
                TableCell(
                    child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Name',
                            style: TextStyle(color: Colors.white)))),
                TableCell(
                    child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Level',
                            style: TextStyle(color: Colors.white)))),
                TableCell(
                    child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Betting',
                            style: TextStyle(color: Colors.white)))),
                TableCell(
                    child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Members',
                            style: TextStyle(color: Colors.white)))),
              ],
            ),
            buildTableRow('You', '8 (1.0%)', '972,000', '49'),
            buildTableRow('A', '8 (1.0%)', '760,000', '35'),
            buildTableRow('B', '6 (0.8%)', '210,000', '13'),
            buildTableRow('C', '1 (0.3%)', '2,000', '1'),
          ],
        ),
      ),
    );
  }

  TableRow buildTableRow(
      String name, String level, String betting, String members) {
    return TableRow(
      decoration: const BoxDecoration(color: Colors.black),
      children: [
        TableCell(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    Text(name, style: const TextStyle(color: Colors.white)))),
        TableCell(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    Text(level, style: const TextStyle(color: Colors.white)))),
        TableCell(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(betting,
                    style: const TextStyle(color: Colors.white)))),
        TableCell(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(members,
                    style: const TextStyle(color: Colors.white)))),
      ],
    );
  }
}
