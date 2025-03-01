import 'package:flutter/material.dart';
import 'package:wins_pkr/generated/assets.dart';
import 'package:wins_pkr/main.dart';

class ToastLostHelper {
  static void showloss({
    String? subtext,
    String? subtext1,
    String? subtext2,
  }) {
    ToastWidget.showToast(
      subtext: subtext,
      subtext1: subtext1,
      subtext2: subtext2,
    );
  }
}

class ToastWidget extends StatefulWidget {
  final String? subtext;
  final String? subtext1;
  final String? subtext2;

  const ToastWidget({
    Key? key,
    this.subtext,
    this.subtext1,
    this.subtext2,
  }) : super(key: key);

  static void showToast({
    String? subtext,
    String? subtext1,
    String? subtext2,
  }) {
    final overlay = navigatorKey.currentState?.overlay;
    if (overlay == null) return;

    final entry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).size.height * 0.4,
        right: MediaQuery.of(context).size.width * 0.15,
        child: Material(
          color: Colors.transparent,
          child: ToastWidget(
            subtext: subtext,
            subtext1: subtext1,
            subtext2: subtext2,
          ),
        ),
      ),
    );

    overlay.insert(entry);
    Future.delayed(const Duration(seconds: 3), () => entry.remove());
  }

  @override
  _ToastWidgetState createState() => _ToastWidgetState();
}

class _ToastWidgetState extends State<ToastWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width*18,
      height: height*0.2,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: const DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(Assets.imagesLosePopup),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: height*0.08),
          Text(
            widget.subtext1 =="1"?"Green":widget.subtext1 =="2"?"Yellow":"Red",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w900,
              color: widget.subtext1 =="1"?Colors.green:
              widget.subtext1 =="2"?Colors.yellow:Colors.red,
            ),
          ),
          SizedBox(height: height*0.03),
          Text(
            widget.subtext2==""?"":"Rs${widget.subtext2}",
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}