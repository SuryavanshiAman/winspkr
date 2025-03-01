import 'package:flutter/material.dart';
import 'package:wins_pkr/constants/app_colors.dart';

class VipTextWidget extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  const VipTextWidget(
      {super.key,
      required this.text,
      this.fontSize,
      this.fontWeight,
      this.maxLines,
      this.color,
      this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: textAlign ?? TextAlign.start,
        maxLines: maxLines,
        overflow: maxLines != null ? TextOverflow.ellipsis : null,
        style: TextStyle(
            fontFamily: 'roboto_regular',
            fontSize: fontSize ?? 12,
            fontWeight: fontWeight ?? FontWeight.normal,
            color: color ?? AppColors.blackColor));
  }
}
