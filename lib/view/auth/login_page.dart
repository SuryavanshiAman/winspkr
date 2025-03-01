import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wins_pkr/constants/gradient_app_bar.dart';
import 'package:wins_pkr/constants/app_button.dart';
import 'package:wins_pkr/constants/app_colors.dart';
import 'package:wins_pkr/constants/custom_text_field.dart';
import 'package:wins_pkr/constants/text_widget.dart';
import 'package:wins_pkr/generated/assets.dart';
import 'package:wins_pkr/main.dart';
import 'package:wins_pkr/utils/routes/routers_name.dart';
import 'package:wins_pkr/view/auth/register_page.dart';
import 'package:wins_pkr/view_modal/auth_view_modal.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

final TextEditingController phone = TextEditingController();
final TextEditingController password = TextEditingController();

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: GradientAppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, RoutesName.bottomNavBar);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.white,
          ),
        ),
        title: const TextWidget(
          title: 'Login',
          fontWeight: FontWeight.bold,
          fontSize: 15,
          color: AppColors.whiteColor,
        ),
      ),
      body: Container(
        height: height,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.imagesAuthBg), fit: BoxFit.fill),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 35, right: 35),
          child: ListView(
            children: [
              CustomTextField(
                controller: phone,
                prefixIcon: const Icon(
                  Icons.phone_android,
                  color: Colors.grey,
                ),
                hintText: "Enter Phone Number",
                hintColor: Colors.grey,
                cursorColor: AppColors.whiteColor,
                maxLength: 11,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
              SizedBox(
                height: height * 0.01,
              ),
              CustomTextField(
                controller: password,
                prefixIcon: const Icon(
                  Icons.lock,
                  color: Colors.grey,
                ),
                hintText: "Enter Password",
                hintColor: Colors.grey,
                cursorColor: AppColors.whiteColor,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 15, left: 190),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.customerService);
                  },
                  child: const TextWidget(
                    title: 'Forget password?',
                    fontSize: 13,
                    color: AppColors.whiteColor,
                    fontFamily: "open_sans_reg",
                  ),
                ),
              ),
              AppBtn(
                loading: authViewModel.loadingThree,
                onTap: () {
                  Map data = {
                    "mobile": phone.text,
                    "password": password.text,
                  };
                  authViewModel.loginApi(data, context);
                },
                height: height * 0.05,
                width: width * 0.8,
                title: 'Login',
                titleColor: AppColors.whiteColor,
                fontSize: 15,
                fontWeight: FontWeight.bold,
                gradient: AppColors.appButton,
              ),
              SizedBox(
                height: height * 0.01,
              ),
              const Divider(
                color: AppColors.whiteColor,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const TextWidget(
                    title: 'Not a Member?  ',
                    fontSize: 13,
                    color: Colors.grey,
                    fontFamily: "open_sans_reg",
                    // fontFamily: ,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Register()));
                    },
                    child: const TextWidget(
                      title: '  Create Account',
                      fontSize: 12,
                      color: AppColors.whiteColor,
                      fontFamily: "open_sans_reg",
                    ),
                  ),
                ],
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 55, vertical: 30),
                height: height * 0.12,
                // width: width*0.5,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(Assets.imagesAppLogo),
                      fit: BoxFit.cover),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
