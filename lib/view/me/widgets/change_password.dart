import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wins_pkr/constants/app_button.dart';
import 'package:wins_pkr/constants/app_colors.dart';
import 'package:wins_pkr/constants/custom_text_field.dart';
import 'package:wins_pkr/constants/text_widget.dart';
import 'package:wins_pkr/main.dart';
import 'package:wins_pkr/utils/utils.dart';
import 'package:wins_pkr/view_modal/change_pass_view_modal.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool oldPassword = true;
  bool newPassword = true;
  bool confirmPassword = true;
  TextEditingController oldPasswordCon = TextEditingController();
  TextEditingController newPasswordCon = TextEditingController();
  TextEditingController confirmPasswordCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final changePasswordViewModel =
        Provider.of<ChangePasswordViewModel>(context);

    return Container(
      height: height * 0.55,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: AppColors.appButton,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: height * 0.02,
          ),
          const Center(
            child: TextWidget(
              title: 'Change Password',
              color: AppColors.whiteColor,
              fontWeight: FontWeight.w900,
              fontSize: 22,
            ),
          ),
          SizedBox(
            height: height * 0.03,
          ),
          const TextWidget(
              title: 'Password',
              color: AppColors.whiteColor,
              fontWeight: FontWeight.bold,
              fontSize: 14),
          CustomTextField(
            margin: EdgeInsets.only(top: height * 0.01, bottom: height * 0.01),
            controller: oldPasswordCon,
            filled: true,
            fillColor: AppColors.blackColor,
            prefixIcon: const Icon(
              Icons.lock,
              color: AppColors.greyColor,
            ),
            obscureText: oldPassword,
            maxLines: 1,
            hintText: "Enter Password",
            hintColor: AppColors.greyColor,
            cursorColor: AppColors.whiteColor,
            suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    oldPassword = !oldPassword;
                  });
                },
                icon: Icon(
                  oldPassword ? Icons.visibility_off : Icons.visibility,
                  size: 20,
                  color: AppColors.whiteColor,
                )),
          ),
          const TextWidget(
              title: 'New Password',
              color: AppColors.whiteColor,
              fontWeight: FontWeight.bold,
              fontSize: 14),
          CustomTextField(
            margin: EdgeInsets.only(top: height * 0.01, bottom: height * 0.01),
            controller: newPasswordCon,
            filled: true,
            fillColor: AppColors.blackColor,
            prefixIcon: const Icon(
              Icons.lock,
              color: AppColors.greyColor,
            ),
            obscureText: newPassword,
            hintText: "Enter New Password",
            hintColor: AppColors.greyColor,
            cursorColor: AppColors.whiteColor,
            maxLines: 1,
            suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    newPassword = !newPassword;
                  });
                },
                icon: Icon(
                  newPassword ? Icons.visibility_off : Icons.visibility,
                  size: 20,
                  color: AppColors.whiteColor,
                )),
          ),
          const TextWidget(
              title: 'Confirm New Password',
              color: AppColors.whiteColor,
              fontWeight: FontWeight.bold,
              fontSize: 14),
          CustomTextField(
            filled: true,
            fillColor: AppColors.blackColor,
            margin: EdgeInsets.only(top: height * 0.01, bottom: height * 0.03),
            controller: confirmPasswordCon,
            prefixIcon: const Icon(
              Icons.lock,
              color: AppColors.greyColor,
            ),
            hintText: "Enter Confirm Password",
            hintColor: AppColors.greyColor,
            cursorColor: AppColors.whiteColor,
            obscureText: confirmPassword,
            maxLines: 1,
            suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    confirmPassword = !confirmPassword;
                  });
                },
                icon: Icon(
                  confirmPassword ? Icons.visibility_off : Icons.visibility,
                  size: 20,
                  color: AppColors.whiteColor,
                )),
          ),
          AppBtn(
            loading: changePasswordViewModel.loading,
            onTap: () {
              if(oldPasswordCon.text.isEmpty){
                Utils.flushBarErrorMessage("Enter password", context, );
              } else if(newPasswordCon.text.isEmpty){
                Utils.flushBarErrorMessage("Enter new password", context,);
              }else if (confirmPasswordCon.text.isEmpty){
                Utils.flushBarErrorMessage("Enter confirm password", context, );
              }
              else{
                changePasswordViewModel.changePassApi(oldPasswordCon.text,
                    newPasswordCon.text, confirmPasswordCon.text, context);
              }
            },
            title: 'CONFIRM',
            titleColor: AppColors.whiteColor,
            gradient: AppColors.appBarGradient,
          )
        ],
      ),
    );
  }
}
