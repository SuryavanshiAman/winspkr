import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wins_pkr/constants/app_colors.dart';
import 'package:wins_pkr/generated/assets.dart';
import 'package:wins_pkr/view_modal/services_view_model.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final splashServices =
          Provider.of<SplashServices>(context, listen: false);
      splashServices.updateApkApi(context);
    });

    // Uncomment if navigation is required after the splash screen
    // Timer(const Duration(seconds: 3),
    //    () => Navigator.pushReplacementNamed(context, RoutesName.bottomNavBar));
  }

  @override
  Widget build(BuildContext context) {
   final height = MediaQuery.of(context).size.height;
   final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 10,
        ),
        decoration: const BoxDecoration(
            color: AppColors.blackColor,
            image: DecorationImage(image: AssetImage(Assets.imagesSplashLogo))),
        child: Consumer<SplashServices>(
          builder: (context, splashViewModel, child) {
            return splashViewModel.loading == 0.0
                ? Container()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // SizedBox(height: height * 0.02),
                      const Text(
                        'Please wait while updating app...',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 10,
                        ),
                        child: LinearProgressIndicator(
                          backgroundColor: Colors.white,
                          valueColor: const AlwaysStoppedAnimation<Color>(
                            AppColors.darkYellow,
                          ),
                          value: splashViewModel.loading,
                          minHeight: 10,
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  );
          },
        ),
      ),
    );
  }
}
