import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:wins_pkr/constants/app_button.dart';
import 'package:wins_pkr/constants/app_colors.dart';
import 'package:wins_pkr/constants/gradient_app_bar.dart';
import 'package:wins_pkr/constants/text_widget.dart';
import 'package:wins_pkr/res/image_picker.dart';
import 'package:wins_pkr/view_modal/show_qr_view_model.dart';

class SaveScreenShot extends StatefulWidget {
  final String type;
  final String amount;

  const SaveScreenShot({super.key, required this.type, required this.amount});
  @override
  State<SaveScreenShot> createState() => _SaveScreenShotState();
}

class _SaveScreenShotState extends State<SaveScreenShot> {
  String imagePath = "";
  String uploadedImageUrl = "";

  final ImagePicker _picker = ImagePicker();

  bool loader = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final showQr = Provider.of<ShowQrViewModel>(context, listen: false);
      showQr.showQrApi(widget.type, context);
    });
  }

  // Future<void> _pickImage(ImageSource source) async {
  //   final XFile? pickedFile = await _picker.pickImage(source: source);
  //   if (pickedFile != null) {
  //     setState(() {
  //       imagePath = pickedFile.path;
  //     });
  //   }
  // }
  String myData = '0';
  // Method for Android and iOS
  void _updateImageMobile(ImageSource imageSource) async {
    String? imageData = await ChooseImage.chooseImageAndConvertToString(imageSource);
    if (imageData != null) {
      setState(() {
        myData = imageData;
      });
    }
  }

// Method for Web

  void _updateImageWeb() async {
    if (kIsWeb) { // Ensures this is only executed in a web environment
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        withData: true, // Needed for web
      );

      if (result != null && result.files.single.bytes != null) {
        setState(() {
          myData = base64Encode(result.files.single.bytes!);
        });
      }
    } else {
      // Handle mobile-specific file picking
    }
  }
// Unified method to handle both platforms
  void _updateImage(ImageSource? imageSource) {
    if (kIsWeb) {
      _updateImageWeb();
    } else {
      _updateImageMobile(imageSource!);
    }
  }
  void _settingModalBottomSheet(BuildContext context) {
    if(kIsWeb){
      _updateImage(null);
    }else{
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
      ),
      context: context,
      builder: (BuildContext bc) {
        return SizedBox(
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  _updateImage(ImageSource.camera);
                  Navigator.pop(context);
                },
                child: const Text("Camera"),
              ),
              ElevatedButton(
                onPressed: () {
                  _updateImage(ImageSource.gallery);
                  Navigator.pop(context);
                },
                child: const Text("Gallery"),
              ),
            ],
          ),
        );
      },
    );}
  }

  @override
  Widget build(BuildContext context) {
    final showQr = Provider.of<ShowQrViewModel>(context).showQrData?.data;
    final submitScreenShot = Provider.of<ShowQrViewModel>(context);
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: const GradientAppBar(
        leading: AppBackBtn(),
        centerTitle: true,
        title: Text(
          'Upload ScreenShot',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: AppColors.whiteColor),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Text("Total amount: ${widget.amount}",
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Center(
            child: Container(
              alignment: Alignment.center,
              height: 300,
              width: 300,
              child: showQr?.qrCode != null
                  ? Image.network(
                      showQr!.qrCode.toString(),
                      fit: BoxFit.cover,
                    )
                  : showQr?.qrCode != ''
                      ? const CircularProgressIndicator()
                      : const TextWidget(
                          title: 'No Data Available',
                        ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextWidget(
                title: showQr?.walletAddress?.isNotEmpty ?? false
                    ? showQr!.walletAddress
                    : 'Fetching Wallet Address...',
                fontSize: 12,
                color: AppColors.blackColor,
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  Clipboard.setData(ClipboardData(
                      text: showQr != null
                          ? showQr.walletAddress.toString()
                          : ''));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Wallet Address Copied!")),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.blackColor,
                  ),
                  child: const TextWidget(
                      title: "Copy", fontSize: 15, color: AppColors.whiteColor),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Center(
          //   child: uploadedImageUrl.isNotEmpty
          //       ? Image.network(uploadedImageUrl,
          //           height: 150, width: 150, fit: BoxFit.cover)
          //       : imagePath.isNotEmpty
          //           ? Image.file(File(imagePath),
          //               height: 150, width: 150, fit: BoxFit.cover)
          //           : const Text("No image selected"),
          // ),
          myData=="0"?Center(child: Text("No image selected")): Center(
            child: SizedBox(
              // height: height * 0.1,
              child: Image.memory(base64Decode(myData),fit: BoxFit.fill,scale: 3,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: AppBtn(
              width: 200,
              onTap: () => _settingModalBottomSheet(context),
              title: "Upload Screenshot",
              titleColor: Colors.white,
              gradient: AppColors.appBarGradient2,
            ),
          ),
          const SizedBox(height: 20),
          AppBtn(
            loading: submitScreenShot.loadingOne,
            onTap: () async {
              if (myData!="0") {
                try {
                  // List<int> imageBytes = await File(imagePath).readAsBytes();
                  // String base64Image = base64Encode(imageBytes);
                  await submitScreenShot.usdtAccountViewApi(
                    widget.amount,
                    widget.type,
                    myData,
                    context,
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Failed to upload image: $e")),
                  );
                } finally {
                  setState(() {
                    loader = false;
                  });
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text("Please upload a screenshot first")),
                );
              }
            },
            title: "Confirm",
          )
        ],
      ),
    );
  }
}
