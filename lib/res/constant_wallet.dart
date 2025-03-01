import 'package:flutter/material.dart';
import 'package:wins_pkr/constants/app_colors.dart';
import 'package:wins_pkr/generated/assets.dart';
import 'package:wins_pkr/main.dart';
import 'package:wins_pkr/utils/utils.dart';
import 'package:wins_pkr/view_modal/profile_view_model.dart';
import 'package:provider/provider.dart';

class ConstantWallet extends StatefulWidget {
  const ConstantWallet({super.key});

  @override
  State<ConstantWallet> createState() => _ConstantWalletState();
}

class _ConstantWalletState extends State<ConstantWallet> {
  @override
  Widget build(BuildContext context) {
    final userProfileViewModel = Provider.of<ProfileViewModel>(context);

    return   Container(
      height: height * 0.17,
      width: width,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),

            gradient : AppColors.appBarGradient
          // image: const DecorationImage(
          //     image: AssetImage(Assets.imagesCardImage),
          //     fit: BoxFit.fill)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Image.asset(Assets.iconsWallet, height: 30),
                  const SizedBox(width: 15),
                  const Text(
                    'Balance',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const SizedBox(width: 15),
                  const Text( 'Rs ',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),

                  Text(
                    userProfileViewModel.profileData?.data?.wallet ==
                        null ? '0.00'
                        : '${userProfileViewModel.profileData?.data?.wallet.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 15),
                  InkWell(
                      onTap: () {
                        Provider.of<ProfileViewModel>(context, listen: false).userProfileApi(context);
                        //  context.read<ProfileProvider>().fetchProfileData();
                        Utils.flushBarSuccessMessage(
                          'Wallet refresh ✔',
                          context,
                        );
                      },
                      child: Image.asset(
                        Assets.iconsTotalBal,
                        height: 30,
                      )),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
