import 'package:flutter/material.dart';
import 'package:wins_pkr/constants/gradient_app_bar.dart';
import 'package:wins_pkr/constants/app_button.dart';
import 'package:wins_pkr/constants/app_colors.dart';
import 'package:wins_pkr/constants/custom_text_field.dart';
import 'package:wins_pkr/generated/assets.dart';
import 'package:wins_pkr/main.dart';
import 'package:wins_pkr/utils/utils.dart';
import 'package:wins_pkr/view_modal/auth_view_modal.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  bool hidePassword = true;
  bool isChecked = true;
  bool isPhoneNumberValid = false;

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: GradientAppBar(
        elevation: 10,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'Register',
          style: TextStyle(
            fontSize: 15,
            letterSpacing: 1,
            fontWeight: FontWeight.w900,
            color: AppColors.whiteColor,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.imagesAuthBg),
            fit: BoxFit.fill,
          ),
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: height * 0.05),
                CustomTextField(
                  controller: phone,
                  cursorColor: AppColors.whiteColor,
                  prefixIcon: const Icon(
                    Icons.phone_android,
                    color: AppColors.greyColor,
                  ),
                  maxLength: 11,
                  hintText: "Enter Phone Number",
                  hintColor: AppColors.greyColor,
                  keyboardType: TextInputType.number,
                  onChanged: (v) {
                    if (v.length >= 10||v.length==11) {
                      setState(() {
                        isPhoneNumberValid = true;
                      });
                    } else {
                      setState(() {
                        isPhoneNumberValid = false;
                      });
                    }
                  },
                ),
                const SizedBox(width: 15),
                Column(
                  children: [
                    SizedBox(height: height * 0.01),
                    CustomTextField(
                      controller: email,
                      prefixIcon: const Icon(
                        Icons.email,
                        color: AppColors.greyColor,
                      ),
                      hintColor: Colors.grey,
                      hintText: "Enter Email",
                      cursorColor: AppColors.whiteColor,
                      maxLines: 1,
                    ),
                    SizedBox(height: height * 0.01),
                    CustomTextField(
                      controller: password,
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: AppColors.greyColor,
                      ),
                      obscureText: hidePassword,
                      hintColor: Colors.grey,
                      hintText: "Enter Password",
                      cursorColor: AppColors.whiteColor,
                      maxLines: 1,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            hidePassword = !hidePassword;
                          });
                        },
                        icon: Icon(
                          hidePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          size: 20,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                  ],
                ),
                SizedBox(height: height * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          isChecked = !isChecked;
                        });
                      },
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isChecked ? AppColors.lighterMaroon : null,
                          border: Border.all(
                            color: isChecked ? Colors.black : Colors.white,
                            width: 2.0,
                          ),
                        ),
                        child: isChecked
                            ? const Center(
                                child: Icon(
                                  Icons.check,
                                  size: 20,
                                  color: AppColors.whiteColor,
                                ),
                              )
                            : null,
                      ),
                    ),
                    SizedBox(
                      width: width * 0.015,
                    ),
                    const Text(
                      'I Have Agree To The',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      width: width * 0.01,
                    ),
                    TextButtonView(
                      text: 'Use Privacy Agreement',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      onTap: () {},
                      textColor: AppColors.whiteColor,
                    ),
                  ],
                ),
                SizedBox(height: height * 0.02),
                AppBtn(
                  loading: authViewModel.loadingOne,
                  onTap: () {
                    if (phone.text.isEmpty ||phone.text.length!=11) {
                      Utils.flushBarErrorMessage("Enter Phone Number", context);
                    } else if (password.text.isEmpty) {
                      Utils.flushBarErrorMessage("Enter Password", context);
                    } else if (email.text.isEmpty) {
                      Utils.flushBarErrorMessage("Enter Email", context);
                    } else {
                      authViewModel.registerApi(
                          phone.text.toString(),
                          password.text.toString(),
                          email.text.toString(),
                          context);
                    }
                  },
                  title: 'Register',
                  titleColor: AppColors.whiteColor,
                ),
                SizedBox(height: height * 0.04),
                Center(
                  child: Container(
                    height: height * 0.2,
                    width: width * 0.4,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(Assets.imagesAppLogo),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
