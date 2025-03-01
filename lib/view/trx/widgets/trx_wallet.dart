import 'package:flutter/material.dart';
import 'package:wins_pkr/constants/app_colors.dart';
import 'package:wins_pkr/constants/text_widget.dart';
import 'package:wins_pkr/generated/assets.dart';
import 'package:wins_pkr/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:wins_pkr/view_modal/profile_view_model.dart';

class TrxWallet extends StatefulWidget {
  const TrxWallet({super.key});

  @override
  State<TrxWallet> createState() => _TrxWalletState();
}

class _TrxWalletState extends State<TrxWallet> {
  @override
  Widget build(BuildContext context) {
    final userProfileViewModel = Provider.of<ProfileViewModel>(context);

    if (userProfileViewModel.profileData != null) {
      return Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          gradient: AppColors.appBarGradient,
          borderRadius: BorderRadius.circular(15),
          image: const DecorationImage(
              image: AssetImage(Assets.imagesWalletBg), fit: BoxFit.fill),
        ),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  Assets.iconsGameWallet,
                  height: 30,
                  color: AppColors.whiteColor,
                ),
                const TextWidget(
                  title: '  Wallet Balance',
                  fontWeight: FontWeight.w500,
                  color: AppColors.whiteColor,
                  fontSize: 18,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const TextWidget(
                  title: "Rs ",
                  fontSize: 20,
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.w600,
                ),
                TextWidget(
                  title:
                      userProfileViewModel.profileData!.data!.wallet.toStringAsFixed(2),
                  fontSize: 20,
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    userProfileViewModel.userProfileApi(context);
                    Utils.flushBarSuccessMessage(
                      'Wallet refresh ✔',
                      context,
                    );
                  },
                  child: Image.asset(
                    Assets.iconsTotalBal,
                    height: 30,
                    color: AppColors.whiteColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      );
    } else {
      return Container();
    }
  }
}
