import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:wins_pkr/constants/gradient_app_bar.dart';
import 'package:wins_pkr/constants/app_colors.dart';
import 'package:wins_pkr/constants/custom_text_field.dart';
import 'package:wins_pkr/constants/text_widget.dart';
import 'package:wins_pkr/generated/assets.dart';
import 'package:wins_pkr/main.dart';
import 'package:wins_pkr/model/subordinate_tier_model.dart';
import 'package:wins_pkr/view_modal/subordinate_data_view_model.dart';
import 'package:wins_pkr/view_modal/subordinate_tier_view_model.dart';

class SubordinateDataPage extends StatefulWidget {
  const SubordinateDataPage({super.key});

  @override
  State<SubordinateDataPage> createState() => _SubordinateDataPageState();
}

class _SubordinateDataPageState extends State<SubordinateDataPage> {
  final TextEditingController search = TextEditingController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final subTier =
          Provider.of<SubordinateTierViewModel>(context, listen: false);
      subTier.subordinateTierApi(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final subData = Provider.of<SubordinateDataViewModel>(context);
    final subTier = Provider.of<SubordinateTierViewModel>(context);
    return Scaffold(
      appBar: GradientAppBar(
        gradient: AppColors.appBarGradient,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.whiteColor,
              size: 15,
            )),
        title: const TextWidget(
          title: "Subordinate Data",
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColors.whiteColor,
        ),
      ),
      body: Container(
        height: height,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.imagesAppBg), fit: BoxFit.fill),
        ),
        child: Column(
          children: [
            SizedBox(
              height: height * 0.02,
            ),
            CustomTextField(
              heights: height * 0.09,
              widths: width * 0.9,
              controller: search,
              fillColor: AppColors.greyColor,
              suffixIcon: IconButton(
                onPressed: () {
                  subData.subordinateTierApi(context,
                      '${subTier.tierModelData!.data![subData.selectedTier].id}',0,
                      search: search.text);
                },
                icon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ),
              hintText: "Search Subordinate UID",
              hintColor: Colors.grey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TierBottomSheet(
                  onTierSelected: () {
                    subData.subordinateTierApi(context,
                        '${subTier.tierModelData!.data![subData.selectedTier].id}',1);
                  },
                ),
                DateWidget(
                  onDateSelected: () {
                    subData.subordinateTierApi(context,
                        '${subTier.tierModelData!.data![subData.selectedTier].id}',1,
                        date:
                            '${subData.selectedDate.year}-${subData.selectedDate.month}-${subData.selectedDate.day}');
                  },
                )
              ],
            ),
            SizedBox(height: height * 0.02),
            if (subData.subordinateData != null)
              Container(
                height: height * 0.25,
                width: width * 0.9,
                decoration: BoxDecoration(
                  gradient: AppColors.appBarGradient,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        addTextColumn(
                            '${subData.subordinateData!.data!.numberOfDeposit}',
                            'Deposit Number'),
                        addTextColumn(
                            '${subData.subordinateData!.data!.numberOfBettor}',
                            'Number of Bettor'),
                        addTextColumn(
                            '${subData.subordinateData!.data!.firstDeposit}',
                            'Number of People Making First Deposit'),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        addTextColumn(
                            '${subData.subordinateData!.data!.payInAmount}',
                            'Deposit Amount'),
                        addTextColumn(
                            '${subData.subordinateData!.data!.betAmount}',
                            'Total Bet'),
                        addTextColumn(
                            '${subData.subordinateData!.data!.firstDepositAmount}',
                            'First Deposit Amount'),
                      ],
                    ),
                  ],
                ),
              )
            else
              const Text('No data available!', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }

  Widget addTextColumn(String value, String title) {
    return Container(
      width: width / 2.5,
      alignment: Alignment.center,
      child: Column(
        children: [
          TextWidget(
              title: value,
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: AppColors.whiteColor),
          TextWidget(
              title: title,
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color: AppColors.whiteColor),
        ],
      ),
    );
  }
}

class TierBottomSheet extends StatefulWidget {
  const TierBottomSheet({super.key, required this.onTierSelected});

  final void Function() onTierSelected;

  @override
  TierBottomSheetState createState() => TierBottomSheetState();
}

class TierBottomSheetState extends State<TierBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final subTier = Provider.of<SubordinateTierViewModel>(context);
    final subData = Provider.of<SubordinateDataViewModel>(context);

    return GestureDetector(
      onTap: () {
        showSubordinateFilterBottomSheet(
            context, subData.selectedTier, subTier.tierModelData!.data!);
      },
      child: Container(
        height: height * 0.06,
        width: width * 0.4,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              subTier.tierModelData != null
                  ? '${subTier.tierModelData!.data![subData.selectedTier].name}'
                  : '',
              style: const TextStyle(fontSize: 18, color: Colors.black),
            ),
            const Icon(Icons.keyboard_arrow_down_outlined, color: Colors.black),
          ],
        ),
      ),
    );
  }

  void showSubordinateFilterBottomSheet(
      BuildContext context, int initialIndex, List<Data> itemList) {
    final subData =
        Provider.of<SubordinateDataViewModel>(context, listen: false);
    int selectedIndex = initialIndex;

    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          topLeft: Radius.circular(10),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: height * 0.3,
          decoration: const BoxDecoration(
              gradient: AppColors.appBarGradient,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15))),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context); // Close the bottom sheet
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  TextButton(
                    onPressed: widget.onTierSelected,
                    child: const Text(
                      'Confirm',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: CupertinoPicker(
                  selectionOverlay:
                      const CupertinoPickerDefaultSelectionOverlay(
                    background: CupertinoDynamicColor.withBrightness(
                      color: Colors.transparent,
                      darkColor: Colors.transparent,
                    ),
                  ),
                  scrollController: FixedExtentScrollController(
                    initialItem: initialIndex,
                  ),
                  itemExtent: 50,
                  onSelectedItemChanged: (int index) {
                    selectedIndex = index;
                    subData.setTier(selectedIndex);
                  },
                  children: itemList
                      .map((data) => Text(
                            data.name.toString(),
                            style: const TextStyle(color: Colors.white),
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        );
      },
    ).then((value) {
      if (value != null) {
        if (kDebugMode) {
          print('Tier-$value');
        }
      }
    });
  }
}

// class DateWidget extends StatefulWidget {
//   const DateWidget({
//     super.key,
//     required this.onDateSelected,
//   });
//
//   final void Function() onDateSelected;
//   @override
//   DateWidgetState createState() => DateWidgetState();
// }
//
// class DateWidgetState extends State<DateWidget> {
//   @override
//   Widget build(BuildContext context) {
//     final resData=Provider.of<SubordinateDataViewModel>(context);
//     return GestureDetector(
//       onTap: () {
//         _showMonthPicker(context);
//       },
//       child: Container(
//         height: height * 0.06,
//         width: width * 0.4,
//         padding: EdgeInsets.all(5),
//         decoration: BoxDecoration(
//             color: Colors.white, borderRadius: BorderRadius.circular(5)),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               ' ${resData.selectedDate.year}-${resData.selectedDate.month}-${resData.selectedDate.day}',
//               style: TextStyle(fontSize: 18, color: Colors.black),
//             ),
//             const Icon(
//               Icons.keyboard_arrow_down,
//               color: Colors.black,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Future<void> _showMonthPicker(BuildContext context) async {
//     DateTime? selectedDate = await showModalBottomSheet(
//       backgroundColor: const Color(0xff4287ff),
//       shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.only(
//               topRight: Radius.circular(10), topLeft: Radius.circular(10))),
//       context: context,
//       builder: (BuildContext context) {
//         return Container(
//           height: 300,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(5),
//           ),
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     InkWell(
//                       onTap: () {
//                         Navigator.pop(context);
//                       },
//                       child: const Text(
//                         'Cancel',
//                         style: TextStyle(
//                           fontSize: 18,
//                           color: Colors.white,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ),
//                     const Text(
//                       'Select a date',
//                       style: TextStyle(
//                         fontSize: 18,
//                         color: Colors.white,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     InkWell(
//                       onTap: widget.onDateSelected,
//                       child: const Text(
//                         'Confirm',
//                         style: TextStyle(
//                           fontSize: 18,
//                           color: Colors.white,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 // color: Colors.purple,
//                 height: 220,
//                 child: _buildMonthPicker(),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//             ],
//           ),
//         );
//       },
//     );
//
//     if (selectedDate != null) {
//
//       setState(() {
//         _selectedDate = selectedDate;
//       });
//     }
//   }
//
//   Widget _buildMonthPicker() {
//     int daysInMonth =
//         DateTime(_selectedDate.year, _selectedDate.month + 1, 0).day;
//     return Row(
//       children: [
//         Expanded(
//           child: CupertinoPicker(
//             selectionOverlay: const CupertinoPickerDefaultSelectionOverlay(
//               background: CupertinoDynamicColor.withBrightness(
//                 color: Colors.transparent,
//                 darkColor: Colors.transparent,
//               ),
//             ),
//             scrollController: FixedExtentScrollController(
//               initialItem: _selectedDate.year - 2024,
//             ),
//             itemExtent: 40,
//             onSelectedItemChanged: (yearIndex) {
//               setState(() {
//                 _selectedDate = DateTime(
//                     2024 + yearIndex, _selectedDate.month, _selectedDate.day);
//               });
//             },
//             children: List.generate(2050 - 2024 + 1, (yearIndex) {
//               final year = 2024 + yearIndex;
//               return Center(
//                 child: Text(
//                   year.toString(),
//                   style: const TextStyle(fontSize: 17, color: Colors.white),
//                 ),
//               );
//             }),
//           ),
//         ),
//         Expanded(
//           child: CupertinoPicker(
//             scrollController: FixedExtentScrollController(
//               initialItem: _selectedDate.month - 1,
//             ),
//             itemExtent: 40,
//             onSelectedItemChanged: (monthIndex) {
//               setState(() {
//                 _selectedDate = DateTime(
//                     _selectedDate.year, monthIndex + 1, _selectedDate.day);
//               });
//             },
//             selectionOverlay: const CupertinoPickerDefaultSelectionOverlay(
//               background: CupertinoDynamicColor.withBrightness(
//                 color: Colors.transparent,
//                 darkColor: Colors.transparent,
//               ),
//             ),
//             children: List.generate(12, (monthIndex) {
//               return Center(
//                 child: Text(
//                   DateFormat('MM')
//                       .format(DateTime(_selectedDate.year, monthIndex + 1)),
//                   style: const TextStyle(fontSize: 17, color: Colors.white),
//                 ),
//               );
//             }),
//           ),
//         ),
//         Expanded(
//           child: CupertinoPicker(
//             scrollController: FixedExtentScrollController(
//               initialItem: _selectedDate.day - 1,
//             ),
//             itemExtent: 40,
//             onSelectedItemChanged: (dayIndex) {
//               setState(() {
//                 _selectedDate = DateTime(
//                     _selectedDate.year, _selectedDate.month, dayIndex + 1);
//               });
//             },
//             selectionOverlay: const CupertinoPickerDefaultSelectionOverlay(
//               background: CupertinoDynamicColor.withBrightness(
//                 color: Colors.transparent,
//                 darkColor: Colors.transparent,
//               ),
//             ),
//             children: List.generate(daysInMonth, (dayIndex) {
//               return Center(
//                 child: Text(
//                   (dayIndex + 1).toString(),
//                   style: const TextStyle(fontSize: 17, color: Colors.white),
//                 ),
//               );
//             }),
//           ),
//         ),
//       ],
//     );
//   }
// }

class DateWidget extends StatefulWidget {
  const DateWidget({
    super.key,
    required this.onDateSelected,
  });

  final void Function() onDateSelected;

  @override
  DateWidgetState createState() => DateWidgetState();
}

class DateWidgetState extends State<DateWidget> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    final resData =
        Provider.of<SubordinateDataViewModel>(context, listen: false);
    _selectedDate = resData.selectedDate;
  }

  @override
  Widget build(BuildContext context) {
    final resData = Provider.of<SubordinateDataViewModel>(context);
    return GestureDetector(
      onTap: () {
        _showMonthPicker(context);
      },
      child: Container(
        height: height * 0.06,
        width: width * 0.4,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${resData.selectedDate.year}-${resData.selectedDate.month}-${resData.selectedDate.day}',
              style: const TextStyle(fontSize: 18, color: Colors.black),
            ),
            const Icon(Icons.keyboard_arrow_down, color: Colors.black),
          ],
        ),
      ),
    );
  }

  Future<void> _showMonthPicker(BuildContext context) async {
    DateTime? selectedDate = await showModalBottomSheet<DateTime>(
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          topLeft: Radius.circular(10),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: height * 0.3,
          decoration: const BoxDecoration(
              gradient: AppColors.appBarGradient,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15))),
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  InkWell(
                    onTap: widget.onDateSelected,
                    child: const Text(
                      'Confirm',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Year',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                  Text(
                    'Month',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                  Text(
                    'Day',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: height*0.15,
                  child: _buildMonthPicker()),
            ],
          ),
        );
      },
    );

    if (selectedDate != null) {
      setState(() {
        _selectedDate = selectedDate;
      });
    }
  }

  Widget _buildMonthPicker() {
    int daysInMonth =
        DateTime(_selectedDate.year, _selectedDate.month + 1, 0).day;
    return Row(
      children: [
        Expanded(
          child: CupertinoPicker(
            scrollController: FixedExtentScrollController(
              initialItem: _selectedDate.year - 2024,
            ),
            itemExtent: 40,
            onSelectedItemChanged: (yearIndex) {
              setState(() {
                _selectedDate = DateTime(
                    2024 + yearIndex, _selectedDate.month, _selectedDate.day);
              });
            },
            children: List.generate(2050 - 2024 + 1, (yearIndex) {
              return Center(
                child: Text(
                  (2024 + yearIndex).toString(),
                  style: const TextStyle(fontSize: 17, color: Colors.white),
                ),
              );
            }),
          ),
        ),
        Expanded(
          child: CupertinoPicker(
            scrollController: FixedExtentScrollController(
              initialItem: _selectedDate.month - 1,
            ),
            itemExtent: 40,
            onSelectedItemChanged: (monthIndex) {
              setState(() {
                _selectedDate = DateTime(
                    _selectedDate.year, monthIndex + 1, _selectedDate.day);
              });
            },
            children: List.generate(12, (monthIndex) {
              return Center(
                child: Text(
                  DateFormat('MM').format(DateTime(2024, monthIndex + 1)),
                  style: const TextStyle(fontSize: 17, color: Colors.white),
                ),
              );
            }),
          ),
        ),
        Expanded(
          child: CupertinoPicker(
            scrollController: FixedExtentScrollController(
              initialItem: _selectedDate.day - 1,
            ),
            itemExtent: 40,
            onSelectedItemChanged: (dayIndex) {
              setState(() {
                _selectedDate = DateTime(
                    _selectedDate.year, _selectedDate.month, dayIndex + 1);
              });
            },
            children: List.generate(daysInMonth, (dayIndex) {
              return Center(
                child: Text(
                  (dayIndex + 1).toString(),
                  style: const TextStyle(fontSize: 17, color: Colors.white),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
