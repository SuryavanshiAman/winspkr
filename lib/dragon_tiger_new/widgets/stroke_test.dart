import 'package:flutter/material.dart';

class StrokeText extends StatelessWidget {
  final String text;
  final double strokeWidth;
  final Color textColor;
  final Color strokeColor;
  final TextStyle? textStyle;
  final double? fontSize;

  const StrokeText(
      {Key? key,
        required this.text,
        this.strokeWidth = 1,
        this.strokeColor = Colors.black,
        this.textColor = Colors.white,
        this.textStyle,
        this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text,
          style: TextStyle(
            // decoration: TextDecoration.lineThrough,
            // decorationColor: Colors.red,
            // decorationThickness: 2,
            // decorationStyle: TextDecorationStyle.dashed,
            fontSize: fontSize,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = strokeWidth
              ..color = strokeColor,
          ).merge(textStyle),
        ),
        Text(
          text,
          style:
          TextStyle(color: textColor, fontSize: fontSize).merge(textStyle),
        ),
      ],
    );
  }
}