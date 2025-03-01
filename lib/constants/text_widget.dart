import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
    this.title,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.fontFamily, 
    this.maxLines, 
    this.decoration,
    this.textAlign,
  });
  final String? title;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final int? maxLines;
  final TextDecoration? decoration;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: maxLines,
      textAlign: textAlign??TextAlign.center,
      title ?? '',
      style: TextStyle(
          decoration:decoration,
          color: color ?? Colors.black,
          fontSize: fontSize ?? 20,
          fontWeight: fontWeight ?? FontWeight.normal,
        fontFamily:fontFamily??""
      ),
    );
  }
}