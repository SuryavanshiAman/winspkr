import 'package:flutter/material.dart';
import 'package:wins_pkr/constants/app_colors.dart';
import 'package:wins_pkr/constants/text_widget.dart';
import 'package:wins_pkr/main.dart';
import 'package:wins_pkr/utils/routes/routers_name.dart';
import 'package:wins_pkr/view_modal/user_view_modal.dart';
import 'package:provider/provider.dart';

class LogoutScreen extends StatefulWidget {
  const LogoutScreen({super.key});

  @override
  State<LogoutScreen> createState() => _LogoutScreenState();
}


class _LogoutScreenState extends State<LogoutScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserViewModel>(context);
    return Container(
      height: height * 0.2,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: AppColors.appButton,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const TextWidget(
            title: "Sign Out",
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: AppColors.whiteColor,
          ),
          SizedBox(
            height: height*0.01,
          ),
          const TextWidget(
            title: "Are you sure want to SignOut",
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: AppColors.whiteColor,
          ),
          SizedBox(
            height: height*0.04,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PopScope(
                canPop: true,
                child: InkWell(
                  onTap: (){
                    user.remove();
                    user.removeBearerToken();
                    Navigator.of(context, rootNavigator: true).pop();
                    Navigator.pushReplacementNamed(context, RoutesName.login);
                  },
                  child: Container(
                    height: height*0.04,
                    width: width*0.25,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: const TextWidget(
                      title: "Confirm",
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  height: height*0.04,
                  width: width*0.25,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: const Color(0xff780202),
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: const TextWidget(
                    textAlign: TextAlign.center,
                    title: "Cancel",
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
