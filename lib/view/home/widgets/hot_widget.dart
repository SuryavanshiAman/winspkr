import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wins_pkr/constants/app_colors.dart';
import 'package:wins_pkr/constants/text_widget.dart';
import 'package:wins_pkr/generated/assets.dart';
import 'package:wins_pkr/main.dart';
import 'package:wins_pkr/utils/routes/routers_name.dart';
import 'package:wins_pkr/view/home/controller/home_controller.dart';
import 'package:wins_pkr/view_modal/user_view_modal.dart';

class HotScreen extends StatefulWidget {
  const HotScreen({super.key});

  @override
  State<HotScreen> createState() => _HotScreenState();
}

class _HotScreenState extends State<HotScreen> {
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
              title: 'Hot Games',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.whiteColor,
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisExtent: 170),
            itemCount: hoc.hotList.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () async {
                  UserViewModel userViewModal = UserViewModel();
                  String? userId = await userViewModal.getUser();
                  if (userId != null) {
                    Navigator.pushNamed(context, hoc.hotList[index].route!);
                  } else {
                    if (kDebugMode) {
                      print('User Not login!');
                    }
                    Navigator.pushNamed(context, RoutesName.login);
                  }
                },
                child: Center(
                  child: Container(
                    width: width * 0.42,
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage(hoc.hotList[index].img),
                            fit: BoxFit.fill)),
                  ),
                ),
              );
            },
          ),
        ],
      );
    });
  }
}
