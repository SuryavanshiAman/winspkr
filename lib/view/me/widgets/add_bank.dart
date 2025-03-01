import 'package:flutter/material.dart';
import 'package:wins_pkr/constants/gradient_app_bar.dart';
import 'package:wins_pkr/constants/app_colors.dart';
import 'package:wins_pkr/constants/text_widget.dart';
import 'package:wins_pkr/generated/assets.dart';
import 'package:wins_pkr/main.dart';
import 'package:wins_pkr/view/me/widgets/add_bank_pop_up.dart';
import 'package:wins_pkr/view_modal/bank_view_model.dart';
import 'package:provider/provider.dart';

class AddBank extends StatefulWidget {
  const AddBank({
    super.key,
  });

  @override
  State<AddBank> createState() => _AddBankState();
}

class _AddBankState extends State<AddBank> {

  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((_){
  //     final bankViewModel =
  //     Provider.of<BankViewModel>(context, listen: false);
  //     bankViewModel.accountViewApi(context);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
  final bankViewModel = Provider.of<BankViewModel>(context);
    return Scaffold(
      appBar: GradientAppBar(
        elevation: 10,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, size: 15, color: AppColors.whiteColor),
        ),
        centerTitle: true,
        title: const TextWidget(
          title: 'Bank/Easypaisa/jazzcash',
          fontSize: 18,
          fontWeight: FontWeight.w800,
          color: AppColors.whiteColor,
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.imagesAppBg),
            fit: BoxFit.fill,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(15),
          children: [
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const Dialog(child: AddBankPopUp());
                  },
                );
              },
              child: Container(
                height: height * 0.055,
                width: width * 0.44,
                decoration: BoxDecoration(
                  gradient: AppColors.appButton,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add, size: 20, color: AppColors.whiteColor),
                    TextWidget(
                      title: " Add Bank/ Easypaisa/jazzcash",
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: AppColors.whiteColor,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: AppColors.appBarGradient,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Theme(
                    data: ThemeData(
                      dividerColor: Colors.transparent,
                    ),
                    child: ExpansionTile(
                      leading: const TextWidget(
                        title: "Bank/Easypaisa/jazzcash",
                        fontFamily: "openSansSerif",
                        fontWeight: FontWeight.bold,
                        color: AppColors.whiteColor,
                      ),
                      title: const TextWidget(
                        title: "",
                        fontFamily: "openSansSerif",
                        fontWeight: FontWeight.bold,
                        color: AppColors.whiteColor,
                      ),
                      trailing: const Icon(
                        Icons.arrow_drop_down,
                        color: AppColors.whiteColor,
                      ),
                      children: [
                        if(bankViewModel.bankDataModel != null && bankViewModel.bankDataModel!.data!.isNotEmpty)
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            gradient: AppColors.appButton,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.food_bank_outlined, color: AppColors.whiteColor),
                                  TextWidget(
                                    title: "   Bank Details",
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.whiteColor,
                                    fontSize: 15,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                             Column(
                               children: List.generate(bankViewModel.bankDataModel!.data!.length, (index){
                                 final accData = bankViewModel.bankDataModel!.data![index];
                                 return  Container(
                                   margin: const EdgeInsets.all(6),
                                   padding: const EdgeInsets.all(10),
                                   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(10),
                                     border: Border.all(
                                       color: AppColors.whiteColor,
                                     )
                                   ),
                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                                       Column(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         children: [
                                           TextWidget(
                                             title: 'Bank Name: ${accData.bankName??""}',
                                            color: AppColors.whiteColor,fontSize: 13,
                                           ),
                                           TextWidget(
                                             title: 'Account Number: ${accData.accountNum??""}',
                                             color: AppColors.whiteColor,fontSize: 13,
                                           ),
                                           // TextWidget(
                                           //   title: 'IFSC Code: ${accData.ifscCode??""}',
                                           //   color: AppColors.whiteColor,fontSize: 13,
                                           // ),
                                         ],
                                       ),
                                        Row(
                                         children: [
                                           InkWell(
                                             onTap:(){
                                               bankViewModel.deleteAccountApi( context , accData.id.toString());
                                             },
                                               child: const Icon(Icons.delete_outline, color: AppColors.whiteColor, size: 18)),
                                         ],
                                       ),
                                     ],
                                   ),
                                 );
                               }),
                             )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // const SizedBox(height: 15),
            // Column(
            //   children: [
            //     Container(
            //       decoration: BoxDecoration(
            //         gradient: AppColors.appBarGradient,
            //         borderRadius: BorderRadius.circular(10),
            //       ),
            //       child: Theme(
            //         data: ThemeData(
            //           dividerColor: Colors.transparent,
            //         ),
            //         child: ExpansionTile(
            //           leading: const TextWidget(
            //             title: "Crypto",
            //             fontFamily: "openSansSerif",
            //             fontWeight: FontWeight.bold,
            //             color: AppColors.whiteColor,
            //           ),
            //           title: const TextWidget(
            //             title: "",
            //             fontFamily: "openSansSerif",
            //             fontWeight: FontWeight.bold,
            //             color: AppColors.whiteColor,
            //           ),
            //           trailing: const Icon(
            //             Icons.arrow_drop_down,
            //             color: AppColors.whiteColor,
            //           ),
            //           children: [
            //             Container(
            //               padding: const EdgeInsets.all(10),
            //               decoration: BoxDecoration(
            //                 gradient: AppColors.appButton,
            //                 borderRadius: BorderRadius.circular(10),
            //               ),
            //               child: const Column(
            //                 children: [
            //                   Row(
            //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                     children: [
            //                       Icon(Icons.food_bank_outlined, color: AppColors.whiteColor),
            //                       TextWidget(
            //                         title: "Upi",
            //                         fontWeight: FontWeight.bold,
            //                         color: AppColors.whiteColor,
            //                         fontSize: 15,
            //                       ),
            //                       Icon(Icons.link_off, color: AppColors.whiteColor),
            //                     ],
            //                   ),
            //                   SizedBox(height: 10),
            //                   Row(
            //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                     children: [
            //                       Column(
            //                         crossAxisAlignment: CrossAxisAlignment.start,
            //                         children: [
            //                           Text(
            //                             'Account Number: ',
            //                             style: TextStyle(color: AppColors.whiteColor),
            //                           ),
            //                           Text(
            //                             'IFSC Code: ',
            //                             style: TextStyle(color: AppColors.whiteColor),
            //                           ),
            //                         ],
            //                       ),
            //                       Row(
            //                         children: [
            //                           Icon(Icons.settings, color: AppColors.whiteColor, size: 18),
            //                           Icon(Icons.copy, color: AppColors.whiteColor, size: 15),
            //                         ],
            //                       ),
            //                     ],
            //                   ),
            //                 ],
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}

