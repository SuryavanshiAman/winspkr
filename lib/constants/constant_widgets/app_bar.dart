import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wins_pkr/constants/gradient_app_bar.dart';
import 'package:wins_pkr/constants/app_button.dart';
import 'package:wins_pkr/constants/app_colors.dart';
import 'package:wins_pkr/constants/text_widget.dart';
import 'package:wins_pkr/generated/assets.dart';
import 'package:wins_pkr/main.dart';
import 'package:wins_pkr/utils/utils.dart';
import 'package:wins_pkr/view/auth/login_page.dart';
import 'package:wins_pkr/view/auth/register_page.dart';
import 'package:wins_pkr/view_modal/profile_view_model.dart';
import 'package:wins_pkr/view_modal/user_view_modal.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class AppBarPage extends StatelessWidget implements PreferredSizeWidget {
  const AppBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userProfileViewModel = Provider.of<ProfileViewModel>(context);
    return GradientAppBar(
      gradient: AppColors.appBarGradient,
      leadingWidth: width*0.3,
      leading: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.imagesAppLogo), fit: BoxFit.cover),
        ),
      ),
      actions: [
        FutureBuilder<String?>(
          future: Provider.of<UserViewModel>(context, listen: false).getUser(),
          builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              String? user = snapshot.data;

              return user == "0" || user == null
                  ? _buildLoginRegisterButtons(context)
                  : _buildWalletInfo(context, userProfileViewModel);
            }
          },
        ),
      ],
    );
  }

  Widget _buildLoginRegisterButtons(BuildContext context) {
    return SizedBox(
      height: height * 0.03,
      width: width * 0.35,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Login()),
              );
            },
            child: const TextWidget(
              title: 'Login',
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: AppColors.whiteColor,
            ),
          ),
          AppBtn(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Register()),
              );
            },
            height: height * 0.035,
            width: width * 0.16,
            title: 'Register',
            titleColor: AppColors.whiteColor,
            fontSize: 13,
            fontWeight: FontWeight.bold,
            gradient: AppColors.appButton,
          ),
        ],
      ),
    );
  }

  Widget _buildWalletInfo(
      BuildContext context, ProfileViewModel userProfileViewModel ) {
    return Row(
      children: [
        Container(
          height: height * 0.04,
          width: width * 0.35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            gradient: AppColors.appButton,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextWidget(
                title: 'Rs ${userProfileViewModel.profileData?.data?.wallet.toStringAsFixed(2)}',
                color: AppColors.whiteColor,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
              InkWell(
                onTap: () {

                  userProfileViewModel.userProfileApi(context);
                  Utils.flushBarSuccessMessage(
                      'Wallet refresh ✔', context);
                },
                child: const Icon(
                  Icons.restart_alt_outlined,
                  color: AppColors.whiteColor,
                ),
              ),
            ],
          ),
        ),
        kIsWeb == true
            ? Row(
          children: [
            IconButton(
              onPressed: () {
                launchURL2(context);
              },
              icon: const Icon(Icons.download_for_offline,
                  color: AppColors.goldencolor),
            ),

          ],
        )
            : Container(),
      ],
    );
  }




  launchURL2(context) async {

    final userProfileViewModel = Provider.of<ProfileViewModel>(context, listen: false);

    var url = userProfileViewModel.profileData!.appDownloadLink.toString();
    if (await canLaunch(url)) {
    await launch(url);
    } else {
    throw 'Could not launch $url';
    }
  }


  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}


