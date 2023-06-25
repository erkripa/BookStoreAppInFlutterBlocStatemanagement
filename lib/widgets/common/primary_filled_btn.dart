import 'package:course_app/utils/app_colors.dart';
import 'package:course_app/utils/dm.dart';
import 'package:course_app/utils/styles/app_text_style.dart';
import 'package:flutter/material.dart';

class AyushFilledButton extends StatelessWidget {
  const AyushFilledButton({
    Key? key,
    required this.label,
    this.bgColor,
    this.borderRadius,
    this.prefix,
    this.suffix,
    this.labelColor,
    this.onTap,
    this.padding,
    this.fontSize,
    this.width,
    this.height,
    this.labelStyle,
  }) : super(key: key);

  final Color? bgColor;
  final double? borderRadius;
  final String label;
  final Color? labelColor;
  final Widget? prefix;
  final Widget? suffix;
  final VoidCallback? onTap;
  final EdgeInsets? padding;
  final double? fontSize;
  final double? width;
  final double? height;
  final TextStyle? labelStyle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        constraints: BoxConstraints(maxWidth: Dm.screenWidth),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? Dm.four),
          color: bgColor ?? AppColors.primaryColor,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (prefix != null) prefix!,
            if (prefix != null) Dm.boxWidth4,
            Text(
              label,
              style: labelStyle ??
                  AppStyles.style16Bold.copyWith(
                    color: labelColor ??
                        Theme.of(context).textTheme.bodyLarge!.color,
                    fontSize: fontSize ?? Dm.sixTeen,
                  ),
            ),
            if (suffix != null) Dm.boxWidth4,
            if (suffix != null) suffix!,
          ],
        ),
      ),
    );
  }
}
