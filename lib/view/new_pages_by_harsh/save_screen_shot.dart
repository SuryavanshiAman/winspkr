import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:wins_pkr/constants/app_button.dart';
import 'package:wins_pkr/constants/app_colors.dart';
import 'package:wins_pkr/constants/gradient_app_bar.dart';
import 'package:wins_pkr/constants/text_widget.dart';
import 'package:image_picker/image_picker.dart';
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

  Future<void> _pickImage(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        imagePath = pickedFile.path;
      });
    }
  }

  void _settingModalBottomSheet(BuildContext context) {
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
                  _pickImage(ImageSource.camera);
                  Navigator.pop(context);
                },
                child: const Text("Camera"),
              ),
              ElevatedButton(
                onPressed: () {
                  _pickImage(ImageSource.gallery);
                  Navigator.pop(context);
                },
                child: const Text("Gallery"),
              ),
            ],
          ),
        );
      },
    );
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
          Center(
            child: uploadedImageUrl.isNotEmpty
                ? Image.network(uploadedImageUrl,
                    height: 150, width: 150, fit: BoxFit.cover)
                : imagePath.isNotEmpty
                    ? Image.file(File(imagePath),
                        height: 150, width: 150, fit: BoxFit.cover)
                    : const Text("No image selected"),
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
              if (imagePath.isNotEmpty) {
                try {
                  List<int> imageBytes = await File(imagePath).readAsBytes();
                  String base64Image = base64Encode(imageBytes);
                  await submitScreenShot.usdtAccountViewApi(
                    widget.amount,
                    widget.type,
                    base64Image,
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
