import 'package:flutter/material.dart';
import 'package:wins_pkr/constants/gradient_app_bar.dart';
import 'package:wins_pkr/constants/app_colors.dart';
import 'package:wins_pkr/constants/text_widget.dart';
import 'package:wins_pkr/generated/assets.dart';
import 'package:wins_pkr/main.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: GradientAppBar(
        elevation: 10,
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios,size: 15,color: AppColors.whiteColor,)
        ),
        centerTitle: true,
        title: const TextWidget(
            title: 'Message',
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: AppColors.whiteColor
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.imagesAppBg),
            fit: BoxFit.fill,
          ),
        ),
        child: ListView(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          children:  [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount:5,
              itemBuilder: (context, index) {
                return Container(
                  height: height*0.18,
                  width: width*0.92,
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.all(15),
                  decoration:  BoxDecoration(
                    gradient: AppColors.appBarGradient,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TextWidget(
                        title: "Important notice",
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.whiteColor,
                      ),
                      SizedBox(
                        height: height*0.01,
                      ),
                      const TextWidget(
                        textAlign: TextAlign.start,
                        title: "Dear VIP players sincerely invite you to participate in the 3rd anniversary "
                            "event to win 1 billion bonuses. Log in to get 2888rs!",
                        fontSize: 12,
                        color: AppColors.whiteColor,
                      ),
                      SizedBox(
                        height: height*0.02,
                      ),
                      const TextWidget(
                        title: "2024-09-01 20:09:28",
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppColors.whiteColor,
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
