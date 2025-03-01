import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wins_pkr/constants/app_colors.dart';
import 'package:wins_pkr/main.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final InputDecoration? decoration = const InputDecoration();
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign textAlign = TextAlign.start;
  final TextAlignVertical? textAlignVertical;
  final TextDirection? textDirection;
  final bool readOnly = false;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final Widget? icon;
  final Color? iconColor;
  final String? hintText;
  final bool? filled;
  final Color? fillColor;
  final Color? focusColor;
  final Color? hoverColor;
  final void Function(String)? onChanged;
  final double? heights;
  final double? widths;
  final double? hintSize;
  final double? fontSize;
  final BoxBorder? border;
  final BorderRadiusGeometry? borderRadius;
  final List<BoxShadow>? boxShadow;
  final EdgeInsetsGeometry? contentPadding;
  final double? cursorHeight;
  final Color? cursorColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final BorderRadius? fieldRadius;
  final bool? enabled;
  final void Function()? onTap;
  final bool? autofocus;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final EdgeInsetsGeometry? margin;
  final Color? hintColor;
  final String? errorText;
  final BorderSide? borderSide;
  final Color? textColor;
  final FontWeight? fontWeight;
  final FontWeight? hintWeight;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextField({
    super.key,
    this.controller,
    this.style,
    this.strutStyle,
    this.textAlignVertical,
    this.textDirection,
    this.minLines,
    this.maxLength,
    this.obscureText = false,
    this.keyboardType,
    this.icon,
    this.iconColor,
    this.hintText,
    this.filled,
    this.fillColor,
    this.focusColor,
    this.hoverColor,
    this.onChanged,
    this.heights,
    this.widths,
    this.hintSize,
    this.fontSize,
    this.border,
    this.borderRadius,
    this.boxShadow,
    this.contentPadding,
    this.cursorHeight,
    this.cursorColor,
    this.prefixIcon,
    this.suffixIcon,
    this.fieldRadius,
    this.enabled,
    this.maxLines,
    this.onTap,
    this.autofocus,
    this.onSaved,
    this.validator,
    this.margin,
    this.hintColor,
    this.errorText,
    this.borderSide,
    this.textColor,
    this.fontWeight,
    this.hintWeight,
    this.textInputAction,
    this.inputFormatters,
    readOnly,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: margin,
        height: heights ?? height * 0.06,
        width: widths ?? width * 0.8,
        decoration: BoxDecoration(
          border: border,
          borderRadius: borderRadius,
          boxShadow: boxShadow,
        ),
        child: TextFormField(
          textInputAction: textInputAction ?? TextInputAction.done,
          validator: validator,
          onSaved: onSaved,
          autofocus: autofocus ?? false,
          textAlignVertical: TextAlignVertical.center,
          enabled: enabled,
          controller: controller,
          cursorColor: cursorColor ?? AppColors.blackColor,
          cursorHeight: cursorHeight,
          onChanged: onChanged,
          maxLines: maxLines,
          maxLength: maxLength,
          readOnly: readOnly,
          obscureText: obscureText!,
          keyboardType: keyboardType,
          style: style ??
               TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: textColor??AppColors.whiteColor),
          decoration: InputDecoration(
            errorText: errorText,
            // counterText: "",
            counter: const Offstage(),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            filled: filled ?? true,
            fillColor: fillColor ?? Colors.black,

            hintText: hintText,
            hintStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: hintColor ?? AppColors.blackColor),

            contentPadding: contentPadding ??
                const EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 0),
            border: OutlineInputBorder(
                borderSide: borderSide == null
                    ? const BorderSide(
                        width: 0,
                        color: AppColors.blackColor,
                      )
                    : borderSide!,
                borderRadius: fieldRadius == null
                    ? const BorderRadius.all(Radius.circular(5))
                    : fieldRadius!),
            focusedBorder: OutlineInputBorder(
                borderSide: borderSide == null
                    ? BorderSide(
                        width: 1, color: AppColors.blackColor.withOpacity(0.5))
                    : borderSide!,
                borderRadius: fieldRadius == null
                    ? const BorderRadius.all(Radius.circular(5))
                    : fieldRadius!),
            disabledBorder: OutlineInputBorder(
                borderSide: borderSide == null
                    ? const BorderSide(
                        width: 1,
                        color: AppColors.blackColor,
                      )
                    : borderSide!,
                borderRadius: fieldRadius == null
                    ? const BorderRadius.all(Radius.circular(5))
                    : fieldRadius!),
            enabledBorder: OutlineInputBorder(
                borderSide: borderSide == null
                    ? const BorderSide(
                        width: 1,
                        color: AppColors.blackColor,
                      )
                    : borderSide!,
                borderRadius: fieldRadius == null
                    ? const BorderRadius.all(Radius.circular(5))
                    : fieldRadius!),
          ),
        ),
      ),
    );
  }
}
