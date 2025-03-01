import 'package:flutter/material.dart';
import 'package:wins_pkr/constants/app_colors.dart';
import 'package:wins_pkr/main.dart';

class AppBtn extends StatefulWidget {
  final String? title;
  final Color? titleColor;
  final Color? color;
  final Function()? onTap;
  final double? width;
  final double? height;
  final double? fontSize;
  final bool? loading;
  final Gradient? gradient;
  final bool hideBorder;
  final Widget? child;
  final FontWeight? fontWeight;
  final BoxBorder? border;
  final double borderRadius;

  const AppBtn({
    super.key,
    this.title,
    this.titleColor,
    this.color,
    this.onTap,
    this.width,
    this.height,
    this.fontSize,
    this.loading = false,
    this.gradient,
    this.hideBorder = false,
    this.child,
    this.fontWeight,
    this.border,
    this.borderRadius = 5,
  });

  @override
  State<AppBtn> createState() => _AppBtnState();
}

class _AppBtnState extends State<AppBtn> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    _scaleAnimation = Tween<double>(begin: 1, end: 0.3).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.easeOutQuart));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: widget.loading == false
                ? Container(
              height: widget.height ??
                  height * 0.05,
              width: widget.width ??
                  width * 0.8,
              alignment: Alignment.center,
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(
                gradient: widget.gradient??AppColors.appButton,
                color: widget.color ?? AppColors.darkYellow,
                border: widget.border,
                borderRadius: BorderRadius.circular(widget.borderRadius),
              ),
              child: widget.child ??
                  Text(
                    widget.title!,
                    style: TextStyle(
                      fontSize: widget.fontSize,
                      fontWeight: widget.fontWeight,
                      color: widget.titleColor ?? AppColors.blackColor,
                    ),
                  ),
            )
                : Center(
              child: Container(
                height: 45,
                width: 43,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.darkYellow,
                  borderRadius:
                  BorderRadius.circular(widget.borderRadius),
                ),
                padding: const EdgeInsets.all(12),
                child: const CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 4,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class AppBackBtn extends StatefulWidget {
  final Color? color;

  const AppBackBtn({super.key, this.color});

  @override
  State<AppBackBtn> createState() => _AppBackBtnState();
}

class _AppBackBtnState extends State<AppBackBtn> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 5, 5, 5),
      child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: widget.color ?? AppColors.whiteColor,
          )
      ),
    );
  }
}

class TextButtonView extends StatelessWidget {
  final String? text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? textColor;
  final void Function()? onTap;
  final EdgeInsetsGeometry? padding;
  final TextDecoration? decoration;

  const TextButtonView({
    super.key,
    this.text,
    this.fontSize,
    this.fontWeight,
    this.textColor,
    this.onTap,
    this.padding,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: padding,
        child: Text(
          text ?? "Press Me!",
          style: TextStyle(
            color: textColor ?? AppColors.whiteColor,
            fontSize: fontSize,
            fontWeight: fontWeight,
            decoration: decoration,
          ),
        ),
      ),
    );
  }
}
