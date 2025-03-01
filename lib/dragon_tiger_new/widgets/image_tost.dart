import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ImageToast {
  static void show({
    required String imagePath, // Path to your image asset
    required BuildContext context,
    double? width, // Custom width, pass null if you don't want to set a custom width
    double? height, // Custom width, pass null if you don't want to set a custom width
  }) {
    FToast fToast = FToast();

    // Initialize FToast with the provided context
    fToast.init(context);

    fToast.showToast(
      child: Opacity(
        opacity: 0.9,
        child: Container(
          width: width ?? MediaQuery.of(context).size.width,
          height:height?? MediaQuery.of(context).size.height * 3.18,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(imagePath),
            ),
          ),
        ),
      ),
      gravity: ToastGravity.CENTER,
      toastDuration: const Duration(seconds: 3),
    );
  }
}
