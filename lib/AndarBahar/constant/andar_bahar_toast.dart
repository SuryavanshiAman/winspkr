import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:ui' as ui;

import 'package:wins_pkr/main.dart';


class AndarBaharToast {
  static void show({
    required String message,
    required BuildContext context,
    required String winCard,
  }) {
    FToast fToast = FToast();
    List messages = message.split(' ');

    // Initialize FToast with the provided context
    fToast.init(context);

    fToast.showToast(
      child: Opacity(
        opacity: 0.9,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.18,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Colors.black.withOpacity(0.5),
                Colors.black,
                const Color(0xff070100),
                const Color(0xff070100),
                const Color(0xff332038),
                const Color(0xff332038),
                const Color(0xff070100),
                const Color(0xff070100),
                Colors.black,
                Colors.black.withOpacity(0.5)
              ],
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Add an image to the row
              Container(
                height: height*0.15,
                width: width*0.15,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/cards/$winCard.png'),
                    )
                ),
              ),
              const SizedBox(width: 10), // Add spacing between the image and text
              // Display each word in the message
              for (var data in messages)
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Center(
                    child: ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return ui.Gradient.linear(
                          const Offset(0.0, 0.0),
                          const Offset(200.0, 70.0),
                          [Colors.amber, Colors.deepOrange],
                        );
                      },
                      child: Text(
                        data,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
      gravity: ToastGravity.CENTER,
      toastDuration: const Duration(seconds: 3),
    );
  }
}