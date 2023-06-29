import 'package:course_app/utils/app_colors.dart';
import 'package:course_app/utils/dimens.dart';
import 'package:course_app/utils/styles/app_text_style.dart';
import 'package:course_app/widgets/common/ripple_effect.dart';
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
    this.margin,
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
  final EdgeInsets? margin;
  final double? fontSize;
  final double? width;
  final double? height;
  final TextStyle? labelStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: RippleEffect(
        onTap: onTap,
        child: Container(
          width: width,
          height: height,
          padding: padding,
          constraints: BoxConstraints(maxWidth: Dimens.screenWidth),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius ?? Dimens.four),
            color: bgColor ?? AppColors.primaryColor,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (prefix != null) prefix!,
              if (prefix != null) Dimens.boxWidth4,
              Text(
                label,
                style: labelStyle ??
                    AppStyles.style16Bold.copyWith(
                      color: labelColor ??
                          Theme.of(context).textTheme.titleLarge!.color,
                      fontSize: fontSize ?? Dimens.sixTeen,
                    ),
              ),
              if (suffix != null) Dimens.boxWidth4,
              if (suffix != null) suffix!,
            ],
          ),
        ),
      ),
    );
  }
}
