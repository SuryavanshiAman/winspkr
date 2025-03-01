import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wins_pkr/constants/app_colors.dart';
import 'package:wins_pkr/constants/text_widget.dart';
import 'package:wins_pkr/generated/assets.dart';
import 'package:wins_pkr/main.dart';
import 'package:wins_pkr/view/home/controller/home_controller.dart';

class SportsScreen extends StatefulWidget {
  const SportsScreen({super.key});

  @override
  State<SportsScreen> createState() => _SportsScreenState();
}

class _SportsScreenState extends State<SportsScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(builder: (context, hoc, child) {
      return Column(
          children: [
            SizedBox(
              height: height * 0.01,
            ),
            Container(
              padding: EdgeInsets.all(height * 0.01),
              height: height * 0.055,
              width: width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.imagesHomestrip),
                  fit: BoxFit.fill,
                ),
              ),
              child: const TextWidget(
                textAlign: TextAlign.left,
                title: 'Sports Games',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.whiteColor,
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            SizedBox(
              width: width * 0.95,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: hoc.sportsList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      width: width * 0.6,
                      height: height * 0.15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage(hoc.sportsList[index]),
                            fit: BoxFit.fill),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      }
    );
  }
}
