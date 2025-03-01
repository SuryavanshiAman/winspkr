import 'package:flutter/material.dart';

class MineColor{
  static const whiteColor = Color(0xffffffff);
  static const blackColor = Color(0xff000000);
  static const scaffoldDark = Color(0xff22275b);



  static const LinearGradient buttonGradient = LinearGradient(
    colors: [Color(0xFF29a4f3), Color(0xFF297cf2)],
  );
  static const LinearGradient minesBgGradient = LinearGradient(
    colors: [
      Color(0xFF0781cc),
      Color(0xFF046ad2),
      Color(0xFF0258d8),
    ],
  );
  static const LinearGradient containerGradient = LinearGradient(
    colors: [Color(0xff045490), Color(0xff013599)],
  );

  static LinearGradient ssButton = const LinearGradient(
    colors: [
      Colors.green,
      Colors.green,
    ],
  );

  static const LinearGradient checkOutBtnGradient = LinearGradient(
      colors: [Color(0xFFF87700), Color(0xFFFFCE22)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);
}