import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wins_pkr/constants/gradient_app_bar.dart';
import 'package:wins_pkr/constants/app_colors.dart';
import 'package:wins_pkr/constants/text_widget.dart';
import 'package:wins_pkr/generated/assets.dart';
import 'package:wins_pkr/main.dart';
import 'package:wins_pkr/res/launcher.dart';
import 'package:wins_pkr/view_modal/customer_service_view_model.dart';

class CustomerService extends StatefulWidget {
  const CustomerService({super.key});

  @override
  State<CustomerService> createState() => _CustomerServiceState();
}

class _CustomerServiceState extends State<CustomerService> {
  @override
  void initState() {
    super.initState();
    //customer services
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final cusSer =
          Provider.of<CustomerServiceViewModel>(context, listen: false);
      cusSer.customerServiceApi(context);
    });
  }

  List<IconData> iconList = [Icons.telegram, Icons.wifi_channel, Icons.email];
  @override
  Widget build(BuildContext context) {
    final cusSer = Provider.of<CustomerServiceViewModel>(context);
    return Scaffold(
      appBar: GradientAppBar(
        gradient: AppColors.appBarGradient,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.whiteColor,
              size: 15,
            )),
        title: const TextWidget(
          title: "Customer Service",
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColors.whiteColor,
        ),
      ),
      body: Container(
        height: height,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.imagesAppBg), fit: BoxFit.fill),
        ),
        child: Column(
          children: [
            Container(
              height: height * 0.3,
              width: width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Assets.imagesContactUs),
                    fit: BoxFit.cover),
              ),
            ),
            if(cusSer.customerServiceModel!=null)
            Column(
              children: List.generate(cusSer.customerServiceModel!.data!.length,
                  (index) {
                final res = cusSer.customerServiceModel!.data![index];
                return GestureDetector(
                  onTap: () {
                      Launcher.launchOnWeb(context, res.link!);
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    height: height * 0.08,
                    width: width * 0.85,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      gradient: AppColors.appBarGradient,
                    ),
                    child: ListTile(
                      leading: Icon(
                        iconList[index],
                        color: AppColors.whiteColor,
                      ),
                      title: TextWidget(
                        title: res.name,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.whiteColor,
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios,
                          size: 18, color: AppColors.whiteColor),
                    ),
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
