import 'package:flutter/material.dart';
import 'package:wins_pkr/constants/gradient_app_bar.dart';
import 'package:wins_pkr/constants/app_button.dart';
import 'package:wins_pkr/constants/app_colors.dart';
import 'package:wins_pkr/constants/custom_text_field.dart';
import 'package:wins_pkr/generated/assets.dart';
import 'package:wins_pkr/utils/utils.dart';
import 'package:wins_pkr/view_modal/forget_pass_view_modal.dart';
import 'package:provider/provider.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  bool hideSetPassword = true;
  bool hideConfirmPassword = true;

  TextEditingController phoneCon = TextEditingController();
  TextEditingController newPasswordCon = TextEditingController();
  TextEditingController confirmPasswordCon = TextEditingController();
  TextEditingController verifyCode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final forgetPassViewModel = Provider.of<ForgetPassViewModel>(context);

    return Scaffold(
      appBar: GradientAppBar(
        elevation: 10,
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(15, 5, 5, 5),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios, color: AppColors.whiteColor),
          ),
        ),
        title: const Text(
          'Forgot Password',
          style: TextStyle(
              fontSize: 15, letterSpacing: 1, fontWeight: FontWeight.w900, color: AppColors.whiteColor),
        ),
        centerTitle: true,
      ),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Assets.imagesAppBg), fit: BoxFit.fill)),
          child: createNewPassword(forgetPassViewModel),
        ),
      ),
    );
  }

  Widget createNewPassword(ForgetPassViewModel forgetPassViewModel) {
    return Column(
      children: [
        CustomTextField(
          margin: const EdgeInsets.all(5),
          onChanged: (value) {},
          keyboardType: TextInputType.number,
          controller: phoneCon,
          maxLength: 10,
          hintText: 'Enter Mobile number',
          cursorColor: AppColors.whiteColor,
          hintColor: Colors.grey,
        ),
        CustomTextField(
          obscureText: hideSetPassword,
          controller: newPasswordCon,
          maxLines: 1,
          margin: const EdgeInsets.all(10),
          fieldRadius: BorderRadius.circular(30),
          hintText: 'New Password',
          cursorColor: AppColors.whiteColor,
          hintColor: Colors.grey,
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                hideSetPassword = !hideSetPassword;
              });
            },
            icon: Icon(hideSetPassword ? Icons.visibility_off : Icons.visibility, size: 20, color: AppColors.whiteColor),
          ),
        ),
        CustomTextField(
          obscureText: hideConfirmPassword,
          controller: confirmPasswordCon,
          maxLines: 1,
          margin: const EdgeInsets.all(10),
          hintText: 'Confirm New Password',
          cursorColor: AppColors.whiteColor,
          hintColor: Colors.grey,
          fieldRadius: BorderRadius.circular(30),
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  hideConfirmPassword = !hideConfirmPassword;
                });
              },
              icon: Icon(hideConfirmPassword ? Icons.visibility_off : Icons.visibility, size: 20, color: AppColors.whiteColor)),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
          child: AppBtn(
            loading: forgetPassViewModel.loadingTwo,
            title: 'Submit',
            fontSize: 20,
            onTap: () {
              if(phoneCon.text.isEmpty || phoneCon.text.length!=10){
                Utils.flushBarErrorMessage("Enter phone number", context);
              }else if(newPasswordCon.text.isEmpty){
                Utils.flushBarErrorMessage("Enter new password", context);
              }else if(confirmPasswordCon.text.isEmpty){
                Utils.flushBarErrorMessage("Enter confirm password", context);
              }else{
                forgetPassViewModel.forgetPassApi(
                  phoneCon.text,
                  newPasswordCon.text,
                  confirmPasswordCon.text,
                  context,
                );
              }
            },
            hideBorder: true,
            titleColor: Colors.white,
          ),
        ),
      ],
    );
  }
}

