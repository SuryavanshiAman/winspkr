
import 'package:flutter/material.dart';
import 'package:wins_pkr/generated/assets.dart';
import 'package:wins_pkr/main.dart';


class HideCoins extends StatelessWidget {
  final int otherData;
  const HideCoins(this.otherData, {super.key});
  @override
  Widget build(BuildContext context) {
    String imageUrl = '';
    if (otherData == 1) {
      imageUrl = Assets.chips11;
    } else if (otherData == 5) {
      imageUrl = Assets.chips51;
    } else if (otherData == 10) {
      imageUrl = Assets.chips101;
    } else if (otherData == 50) {
      imageUrl = Assets.chips501;
    } else if (otherData == 100) {
      imageUrl = Assets.chips1001;
    } else if (otherData == 500) {
      imageUrl = Assets.chips5001;
    } else if (otherData == 1000) {
      imageUrl = Assets.chips10001;
    }
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        height: height*0.033,
        width:  height*0.033,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image: AssetImage(
                  imageUrl,
                ),
              fit: BoxFit.contain)),
      ),
    );
  }
}
