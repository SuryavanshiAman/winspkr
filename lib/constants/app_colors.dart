import 'package:flutter/material.dart';

class AppColors {
  static const whiteColor = Colors.white;
  static const blackColor = Colors.black;
  static const marronBlack = Color(0xFF150102);
  static const lighterMaroon = Color(0xFF2c0f52);
  static const lightMarron = Color(0xFF2c0f52);
  static const darkYellow = Color(0xFFfec925);
  static const greyColor = Color(0xFF2b374a);
  static const lightBlack = Color(0xF86D6D6D);
  static const orange = Color(0xfff3930a);
  static const lighterBlack = Color(0xFF454f6d);
  static const lightOrange = Color(0xFFd77a49);
  static const greyLight = Color(0xffeeeeee);
  static const lightWhite = Color(0xFFeeeeee);
  static const scaffoldDark = Color(0xfff6f7ff);
  static const btnColor = Color(0xFF757ba6);
  static const dividerColor = Color(0xFFa6a6a6);
  static const vip1 = Color(0xFFa3b5cf);
  static const vip2 = Color(0xFFe8a460);
  static const vip3 = Color(0xFFff8781);
  static const vip4 = Color(0xFF5ad1f3);
  static const vip5 = Color(0xFFf18ddf);
  static const vip6 = Color(0xFF33b57e);
  static const vip7 = Color(0xFF38aa57);
  static const vip8 = Color(0xFF458bed);
  static const vip9 = Color(0xFFa05afd);
  static const vip10 = Color(0xFFfb9c3d);
  static const vipColor3 = Color(0xFFf05c5c);
  static const vipColor1 = Color(0xFFf05c5c);
  static const vipColor2 = Color(0xFFf05c5c);
  static const vipColor4 = Color(0xFF31b5e8);
  static const vipColor5 = Color(0xFFe764c7);
  static const vipColor6 = Color(0xFF1db08a);
  static const vipColor7 = Color(0xFF1a9357);
  static const vipColor8 = Color(0xFF326fe5);
  static const vipColor9 = Color(0xFF7a32f2);
  static const vipColor10 = Color(0xFFef7b27);

  static const LinearGradient transparentGradient = LinearGradient(
    colors: [Colors.transparent, Colors.transparent],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const LinearGradient appBarGradient = LinearGradient(
    colors: [
      Color(0xFF2c0f52),
      Color(0xff13111a),
    ],
    stops: [
      0.1,
      0.9,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient whiteGradient = LinearGradient(
    colors: [
      Colors.white,
      Colors.white70,
    ],
    stops: [
      0.1,
      0.9,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient appBarGradient2 = LinearGradient(
    colors: [
      Color(0xFF8138f4),
      Color(0xFF5d41e6),
      Color(0xFF4346dc), // Light Gray
      // Medium Gray
    ],
    stops: [0.2, 0.5, 1.0], // Smooth transitions
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static const LinearGradient buttonGradient4 = LinearGradient(
    colors: [
      Color(0xFF8138f4),
      Color(0xFF5d41e6),
      Color(0xFF4346dc), // Light Gray
      // Medium Gray
    ],
    stops: [0.2, 0.5, 1.0], // Smooth transitions
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient appButton = LinearGradient(
      colors: [Color(0xffc08d36), Color(0xffc36d35), Color(0xffc45231)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);

  static const LinearGradient boxGradient = LinearGradient(
    colors: [
      Color(0xFF2b374a),
      Color(0xFF2b374a),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient gradientText = LinearGradient(
      colors: [Color(0xfff4bc14), Color(0xFFf8d335), Color(0xFFfdef5d)],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter);
  static const LinearGradient greenGradient = LinearGradient(
      colors: [Color(0xff146638), Color(0xff146630), Color(0xFF12241f)],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight);
  static LinearGradient goldenGradient = const LinearGradient(
    colors: [
      Color.fromARGB(255, 250, 229, 159),
      Color.fromARGB(255, 196, 147, 63),
    ],
  );
  static const LinearGradient buttonGradient = LinearGradient(
      colors: [Color(0xff780202), Color(0xff500104), Color(0xff220100)],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight);
  static const LinearGradient buttonGradient2 = LinearGradient(
      colors: [Color(0xff780202), Color(0xff650306), Color(0xff59070a)],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight);

  static const LinearGradient loginSecondaryGrad = LinearGradient(
    colors: [Color(0xff220100), Color(0xff780202)],
  );
  static const LinearGradient loginSecondaryGrad1 = LinearGradient(
    colors: [Color(0xff780202), Color(0xff220100)],
  );

  static const primaryTextColor = Color(0xFFFFFFFF);
  static const orangeColor = Color(0xFFcf6829);
  static const black12 = Color(0x1F000000);
  static const black13 = Color(0xF86D6D6D);
  static const black14 = Color(0xFF454f6d);
  static const orange2 = Color(0xfff3930a);
  static const scaffolddark = Color(0xfff6f7ff);
  static const btnTextColor = Color(0xFF44260D);
  static const textColor1 = Color(0xff9b797f); //
  static const textColor2 = Color(0xffa88847);
  static const textColor3 = Color(0xff430c10);
  static const textColor4 = Color(0xff804a5d);
//wingo
  static const gamecolor = Color(0xffeeeeee);
  static const goldColor = Color(0xFFfead02);
  static const goldencolor = Color(0xffedc100);
  static const firstColor = Color(0xFF2b3270);
  static const secondaryTextColor = Color(0xFF759fde);
  static const gradientFirstColor = Color(0xFF43b5ec);
  static const methodblue = Color(0xff598ff9);

  static const LinearGradient boxGradient3 = LinearGradient(
      colors: [Color(0xff780202), Color(0xff650306), Color(0xff59070a)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);

  static const LinearGradient boxGradient2 = LinearGradient(
      colors: [Color(0xFF2b374a), Color(0xFF2b374a), Color(0xFF2b374a)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);

  static const LinearGradient btnColor1 = LinearGradient(
      colors: [Color(0xffc08d36), Color(0xffc36d35), Color(0xffc45231)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);

  static const LinearGradient btnColor3 = LinearGradient(
      colors: [Color(0xff146638), Color(0xff146630), Color(0xFF12241f)],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight);

  static const LinearGradient textColor = LinearGradient(
      colors: [Color(0xfff4bc14), Color(0xFFf8d335), Color(0xFFfdef5d)],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter);

  //wingo

  static const LinearGradient btnYellowGradient = LinearGradient(
    colors: [Color(0xFFf3bd14), Color(0xFFf3bd14)],
  );

  static const LinearGradient btnBlueGradient = LinearGradient(
    colors: [Color(0xFF6da7f4), Color(0xFF6da7f4)],
  );

  static LinearGradient goldenGradientDir = const LinearGradient(colors: [
    Color.fromARGB(255, 250, 229, 159),
    Color.fromARGB(255, 196, 147, 63),
  ], begin: Alignment.topCenter, end: Alignment.bottomCenter);

  static const LinearGradient loginSecondryGrad = LinearGradient(
    colors: [Color(0xff5b89ff), Color(0xff749aff)],
  );
}
