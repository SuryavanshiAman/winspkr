import 'package:flutter/material.dart';
import 'package:wins_pkr/constants/app_colors.dart';


class SelectableContainer extends StatelessWidget {
  final String name;
  final bool isSelected;
  final VoidCallback onTap;
  final double? height;
  final double? width;
  const SelectableContainer({
    super.key,
    required this.name,
    required this.isSelected,
    required this.onTap,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isSelected ? AppColors.darkYellow : Colors.transparent,
          // border: Border.all(
          //   color: isSelected ? Colors.transparent : AppColors.greyColor,
          //   width: 2,
          // ),
        ),
        child: Center(
          child: Text( name,style: TextStyle(color: isSelected ? AppColors.blackColor : AppColors.whiteColor,), ),
        ),
      ),
    );
  }
}
