import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wins_pkr/constants/app_colors.dart';
import 'package:wins_pkr/main.dart';

class Utils {
  static void flushBarSuccessMessage(
      String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        message: message,
        forwardAnimationCurve: Curves.decelerate,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        duration: const Duration(seconds: 3),
        flushbarPosition: FlushbarPosition.TOP,
        backgroundColor: Colors.green,
        borderRadius: BorderRadius.circular(30),
        positionOffset: 20,
        icon: const Icon(
          Icons.error_outline,
          size: 20,
          color: Colors.white,
        ),
      )..show(context),
    );
  }

  static void flushBarErrorMessage(
      String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        message: message,
        forwardAnimationCurve: Curves.decelerate,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        duration: const Duration(seconds: 3),
        flushbarPosition: FlushbarPosition.TOP,
        borderRadius: BorderRadius.circular(30),
        backgroundColor: Colors.red,
        positionOffset: 20,
        icon: const Icon(
          Icons.error_outline,
          size: 20,
          color: AppColors.whiteColor,
        ),
      )..show(context),
    );
  }

  static showExitConfirmation(BuildContext context) async {
    return await showModalBottomSheet(
      elevation: 5,
      backgroundColor: Colors.blue,
      shape: const RoundedRectangleBorder(
          side: BorderSide(width: 2, color: Colors.blue),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      context: context,
      builder: (context) {
        return Container(
          height: height * 0.4,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15))),
          child: Column(
            children: [
              SizedBox(height: height / 30),
              Text("EXIT APP",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: width * 0.06,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: height / 30),
              Text("Are you sure want to exit?",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: width * 0.05,
                  )),
              SizedBox(height: height * 0.04),
              SizedBox(
                width: width * 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            side: const BorderSide(width: 1, color: Colors.white),
                            elevation: 3,
                            backgroundColor: AppColors.whiteColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            padding: EdgeInsets.symmetric(
                                horizontal: width * 0.34,
                                vertical: height * 0.02)),
                        onPressed: () {
                          SystemNavigator.pop();
                        },
                        child: Text("Yes",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: width * 0.06,
                                fontWeight: FontWeight.bold))),
                    SizedBox(height: height * 0.03),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: const BorderSide(width: 1),
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            padding: EdgeInsets.symmetric(
                                horizontal: width * 0.34,
                                vertical: height * 0.02)),
                        onPressed: () {
                          Navigator.pop(context, false);
                        },
                        child: Text("No",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: width * 0.06,
                                fontWeight: FontWeight.bold))),
                  ],
                ),
              )
            ],
          ),
        );
      },
    ) ??
        false;
  }

  static void showImageToast({
    required String imagePath,
    required BuildContext context,
    required width,
    required height,
  }) {
    FToast fToast = FToast();
    fToast.init(context);
    fToast.showToast(
      child: Opacity(
        opacity: 0.9,
        child: Container(
          width: width,
          height: height,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                imagePath,
              ),
            ),
          ),
        ),
      ),
      gravity: ToastGravity.CENTER,
      toastDuration: const Duration(seconds: 3),
    );
  }
}