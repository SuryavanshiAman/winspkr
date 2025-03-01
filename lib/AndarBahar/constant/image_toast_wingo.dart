import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wins_pkr/constants/app_colors.dart';
import 'package:wins_pkr/generated/assets.dart';
import 'package:wins_pkr/main.dart';


class ImageToastWingo {
  ///loss
  static void showloss({
     String ?text,
     String ?subtext,
     String ?subtext1,
     String ?subtext2,
     String ?subtext3,
     String ?subtext4,
    required BuildContext context,

  }) {
    FToast fToast = FToast();

    List<Color> colors;

    if (subtext == '0') {
      colors = [
        AppColors.orangeColor,
        AppColors.primaryTextColor,
      ];
    } else if (subtext == '5') {
      colors = [
        const Color(0xFF40ad72),
        AppColors.primaryTextColor,
      ];
    } else {
      int number = int.parse(
          subtext.toString());
      colors = number.isOdd
          ? [
        const Color(0xFF40ad72),
        const Color(0xFF40ad72),
      ]
          : [
        AppColors.orangeColor,
        AppColors.orangeColor,
      ];
    }




    fToast.init(context);

    fToast.showToast(
      child:  Container(
        width: width*1,
        height: height*0.55,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: const DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(Assets.winGoWinGoLossBg),
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: height*0.17,),
            const Text(
              "Sorry",
           style: TextStyle(
             fontSize: 35,
             color: Colors.white,
             fontWeight: FontWeight.w900,
           ),
            ),
            SizedBox(height: height*0.07,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: width*0.04,),
                const Text(
                  "Lottery result",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 5,),
                Container(
                  width: width*0.22,
                  height: height*0.02,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    gradient: LinearGradient(
                      colors: colors,
                      stops: const [0.5, 0.5],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      tileMode: TileMode.mirror,
                    ),
                  ),
                  child: Center(
                    child: Text(
                     subtext.toString() == '10' ? 'Green' :
                      subtext.toString() == '20' ? 'White' :
                      subtext.toString() == '30' ? 'Orange' :
                      subtext.toString() == '0' ? 'Red White' :
                      subtext.toString() == '5' ? 'Green White' :
                      (subtext.toString() == '1' || subtext.toString() == '3' || subtext.toString() == '7' || subtext.toString() == '9') ? 'green' :
                      'Orange',
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),

                    ),
                  ),
                ),
                const SizedBox(width: 5,),
                Container(
                  width:  width*0.04,
                  height: height*0.02,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: colors,
                      stops: const [0.5, 0.5],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      tileMode: TileMode.mirror,
                    ),
                  ),
                  child:  Center(
                    child: Text(
                      subtext.toString(),
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                  ),
                ),
                const SizedBox(width: 5,),

                Container(
                  width:  width*0.08,
                  height: height*0.02,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    gradient: LinearGradient(
                      colors: colors,
                      stops: const [0.5, 0.5],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      tileMode: TileMode.mirror,
                    ),
                  ),
                  child:  Center(
                    child: Text(
                       int.parse(subtext.toString()) < 5
                          ? 'Small'
                          : 'Big',
                     style: const TextStyle(
                       fontSize: 10,
                       color: Colors.black,
                       fontWeight: FontWeight.bold,
                     ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: height*0.03,),
            Text(
               "Lose",
             style: TextStyle(
               fontSize: 30,
               color: Colors.indigo.shade900,
               fontWeight: FontWeight.w900,
             ),
            ),

            SizedBox(height: height*0.02,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                   "Period : ",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black26,
                  fontWeight: FontWeight.bold,
                ),
                ),
                Text(
                   subtext4=="1"?"1 min":subtext3=="2"?"3 min":subtext3=="4"?"5 min":"10 min",
                 style: const TextStyle(
                   fontSize: 14,
                   color: Colors.black26,
                   fontWeight: FontWeight.w900,
                 ),
                ),
                const SizedBox(width: 10,),
                Text(
                 subtext3.toString(),
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black26,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ],
        ),

      ),
      gravity: ToastGravity.CENTER,
      toastDuration: const Duration(seconds: 3),
    );
  }

  ///win
  static void showwin({
     String ?text,
     String ?subtext,
     String ?subtext1,
     String ?subtext2,
     String ?subtext3,
     String ?subtext4,
    required BuildContext context,

  }) {
    FToast fToast = FToast();

    fToast.init(context);

    List<Color> colors;

    if (subtext == '0') {
      colors = [
        AppColors.orangeColor,
        AppColors.primaryTextColor,
      ];
    } else if (subtext == '5') {
      colors = [
        const Color(0xFF40ad72),
        AppColors.primaryTextColor,
      ];
    } else {
      int number = int.parse(
          subtext.toString());
      colors = number.isOdd
          ? [
        const Color(0xFF40ad72),
        const Color(0xFF40ad72),
      ]
          : [
        AppColors.orangeColor,
        AppColors.orangeColor,
      ];
    }

    fToast.showToast(
      child:  Container(
    width: width*1,
    height: height*0.55,
    padding: const EdgeInsets.all(16.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      image: const DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage(Assets.winGoWinGoWinBg),
      ),
    ),
    child: Column(
      children: [
        SizedBox(height: height*0.17,),
        const Text(
           "Congratulation",
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.w900,
          ),
        ),
        SizedBox(height: height*0.07,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: width*0.04,),
            const Text(
               "Lottery result",
             style: TextStyle(
               fontSize: 14,
               color: Colors.black,
               fontWeight: FontWeight.bold,
             ),
            ),
            const SizedBox(width: 5,),
            Container(
              width: width*0.22,
              height: height*0.02,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                gradient: LinearGradient(
                  colors: colors,
                  stops: const [0.5, 0.5],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  tileMode: TileMode.mirror,
                ),
              ),
              child: Center(
                child: Text(
                  subtext.toString() == '10' ? 'Green' :
                  subtext.toString() == '20' ? 'White' :
                  subtext.toString() == '30' ? 'Orange' :
                  subtext.toString() == '0' ? 'Red White' :
                  subtext.toString() == '5' ? 'Green White' :
                  (subtext.toString() == '1' || subtext.toString() == '3' || subtext.toString() == '7' || subtext.toString() == '9') ? 'green' :
                  'Orange',
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),

                ),
              ),
            ),
            const SizedBox(width: 5,),
            Container(
              width:  width*0.04,
              height: height*0.02,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: colors,
                  stops: const [0.5, 0.5],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  tileMode: TileMode.mirror,
                ),
              ),
              child:  Center(
                child: Text(
                  subtext.toString(),
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 5,),

            Container(
              width:  width*0.08,
              height: height*0.02,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                gradient: LinearGradient(
                  colors: colors,
                  stops: const [0.5, 0.5],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  tileMode: TileMode.mirror,
                ),
              ),
              child:  Center(
                child: Text(
                    int.parse(subtext.toString()) < 5
                      ? 'Small'
                      : 'Big',
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: height*0.03,),
        Text(
       "Bonus",
        style: TextStyle(
          fontSize: 25,
          color: Colors.indigo.shade900,
          fontWeight: FontWeight.w900,
        ),
        ),
        Text(
         'Rs$subtext2',
          style: TextStyle(
            fontSize: 25,
            color: Colors.indigo.shade900,
            fontWeight: FontWeight.w900,
          ),
        ),
        SizedBox(height: height*0.02,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
            "Period : ",
             style: TextStyle(
               fontSize: 14,
               color: Colors.black26,
               fontWeight: FontWeight.bold,
             ),
            ),
            Text(
               subtext4=="1"?"1 min":subtext3=="2"?"3 min":subtext3=="4"?"5 min":"10 min",
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black26,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(width: 10,),
            Text(
               subtext3.toString(),
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black26,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ],
    ),

    ),
      gravity: ToastGravity.CENTER,
      toastDuration: const Duration(seconds: 3),
    );
  }
}