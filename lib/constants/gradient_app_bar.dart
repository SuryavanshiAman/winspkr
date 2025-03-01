import 'package:flutter/material.dart';
import 'package:wins_pkr/constants/app_colors.dart';
import 'package:wins_pkr/main.dart';

class GradientAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final Widget? title;
  final bool? centerTitle;
  final List<Widget>? actions;
  final Gradient? gradient;
  final double? toolbarHeight;
  final double? leadingWidth;
  final double? elevation;
  final Color? color;

  const GradientAppBar({
    super.key,
    this.leading,
    this.title,
    this.centerTitle,
    this.actions,
    this.gradient,
    this.toolbarHeight,
    this.leadingWidth,
    this.elevation,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        gradient: gradient ?? AppColors.appBarGradient,
      ),
      child: AppBar(
        leadingWidth: leadingWidth??width*0.18,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: elevation??0,
        leading: leading,
        title: title ?? const Text(''),
        actions: actions,
        centerTitle: centerTitle ?? false,
        toolbarHeight: toolbarHeight, // Pass the toolbarHeight to AppBar
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight ?? kToolbarHeight);
}
