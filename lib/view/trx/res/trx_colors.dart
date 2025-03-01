import 'package:flutter/material.dart';

class TrxColors {
  static const whiteColor = Colors.white;
  static const blackColor = Colors.black;
  static const marronBlack = Color(0xFF150102);
  static const lighterMaroon = Color(0xFF3c0000);
  static const lightMarron = Color(0xFF770002);
  static const darkYellow = Color(0xFFfec925);
  static const scaffoldDark = Color(0xfff6f7ff);
  static const btnColor = Color(0xFF757ba6);
  static const secondaryTextColor = Color(0xFF759fde);
  static const goldenColor = Color(0xffedc100);
  static const firstColor = Color(0xFF2b3270);

  static const LinearGradient transparentGradient = LinearGradient(
    colors: [Colors.transparent, Colors.transparent],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient appBarGradient = LinearGradient(
      colors: [Color(0xff780202), Color(0xff500104), Color(0xff220100)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);

  static const LinearGradient appButton = LinearGradient(
      colors: [Color(0xffc08d36), Color(0xffc36d35), Color(0xffc45231)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);

  static const LinearGradient boxGradient = LinearGradient(
      colors: [Color(0xFF2b374a), Color(0xFF2b374a), Color(0xFF2b374a)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);

  static const LinearGradient loginSecondaryGrid = LinearGradient(
    colors: [Color(0xff5b89ff), Color(0xff749aff)],
  );

  static const LinearGradient btnYellowGradient = LinearGradient(
    colors: [Color(0xFFf3bd14), Color(0xFFf3bd14)],
  );

  static LinearGradient goldenGradientDir = const LinearGradient(colors: [
    Color.fromARGB(255, 250, 229, 159),
    Color.fromARGB(255, 196, 147, 63),
  ], begin: Alignment.topCenter, end: Alignment.bottomCenter);
}
