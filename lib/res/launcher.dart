import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wins_pkr/utils/utils.dart';

class Launcher {
  static launchWhatsApp(context, String phone) async {
    var whatsAppUrlAndroid =
        'whatsapp://send?phone=+91$phone&text=hello';
    if (await canLaunchUrl(Uri.parse(whatsAppUrlAndroid))) {
      await launchUrl(Uri.parse(whatsAppUrlAndroid));
    } else {
      Utils.flushBarErrorMessage("whatsapp not installed",context);
    }
  }

  static launchDialPad(context, String phone) async {
    var phoneCall = "tel:$phone";
    if (await canLaunchUrl(Uri.parse(phoneCall))) {
      await launchUrl(Uri.parse(phoneCall));
    } else {
      Utils.flushBarErrorMessage("Number Busy",context);
    }
  }

  static launchEmail(context, String email) async {
    var callEmail = "mailto:$email";
    if (await canLaunchUrl(Uri.parse(callEmail))) {
      await launchUrl(Uri.parse(callEmail));
    } else {
      Utils.flushBarErrorMessage("email not login",context);
    }
  }

  static launchOnWeb(context, String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      Utils.flushBarErrorMessage("url not found",context);
    }
  }

  static copyToClipboard(String code, context) {
    Clipboard.setData(
      ClipboardData(
        text: code,
      ),
    ).then(
          (value) => ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.black,
          content: Text('Copied successfully!'),
        ),
      ),
    );
  }
}