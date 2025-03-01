import 'package:flame/components.dart' show TextBoxComponent, TextBoxConfig, TextPaint;
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';

final _regularTextStyle =
TextStyle(fontSize: 50, color: BasicPalette.white.color);
final _regular = TextPaint(style: _regularTextStyle);
final _box = _regular.copyWith(
      (style) => style.copyWith(
    color: Colors.orange,
    fontFamily: 'Arial',
    letterSpacing: 1.0,
  ),
);


class MyTextBox extends TextBoxComponent {
  int balance = 0;
  MyTextBox(
      String text, {
        super.align,
        super.size,
        double? timePerChar,
        double? margins,
      }) : super(
    text: text,
    textRenderer: _box,
    boxConfig: TextBoxConfig(
      maxWidth: 400,
      timePerChar: timePerChar ?? 0.05,
      growingBox: true,
      margins: EdgeInsets.all(margins ?? 25),
    ),
  );

  @override
  void render(Canvas canvas) {
    final rect = Rect.fromLTWH(0, 0, width, height);
    canvas.drawRect(rect, Paint()..color = Colors.transparent);
    super.render(canvas);
  }
}