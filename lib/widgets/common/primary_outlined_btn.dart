import 'package:kahani_box/utils/app_colors.dart';
import 'package:kahani_box/utils/dimens.dart';
import 'package:kahani_box/utils/styles/app_text_style.dart';
import 'package:flutter/material.dart';

class AyushOutlinedButton extends StatelessWidget {
  const AyushOutlinedButton({
    Key? key,
    this.bgColor,
    this.borderRadius,
    required this.label,
    this.prefix,
    this.suffix,
    this.labelColor,
    this.onTap,
    this.padding,
    this.width,
    this.height,
    this.fontSize,
    this.borderColor,
    this.borderWidth,
    this.labelStyle,
    this.minWidth,
    this.margin,
    this.enabled = true,
    this.size,
    this.child,
    this.isCircle = false,
  }) : super(key: key);

  final Color? bgColor;
  final double? borderRadius;
  final String label;
  final Color? labelColor;
  final Color? borderColor;
  final Widget? prefix;
  final Widget? suffix;
  final VoidCallback? onTap;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? width;
  final double? height;
  final double? fontSize;
  final double? borderWidth;
  final double? minWidth;
  final TextStyle? labelStyle;
  final bool enabled;
  final double? size;
  final Widget? child;
  final bool isCircle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: OutlinedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: padding ?? EdgeInsets.zero,
          shape: isCircle ? null : rectangleShape,
          maximumSize: size != null ? Size.square(size!) : null,
          minimumSize: size != null ? Size.square(size!) : null,
          disabledBackgroundColor: Colors.white,
          elevation: 10,
          side: const BorderSide(
            width: 0.8,
            color: AppColors.primaryColor,
            style: BorderStyle.solid,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (prefix != null) prefix!,
            if (prefix != null) Dimens.boxWidth4,
            Text(
              label,
              style: AppStyles.style14Bold
                  .copyWith(
                      color: labelColor ??
                          Theme.of(context).textTheme.bodyLarge!.color,
                      fontSize: fontSize ?? Dimens.sixTeen)
                  .merge(labelStyle),
            ),
            if (suffix != null) Dimens.boxWidth4,
            if (suffix != null) suffix!,
          ],
        ),
      ),
    );
  }

  RoundedRectangleBorder get rectangleShape {
    return RoundedRectangleBorder(
      borderRadius:
          BorderRadius.circular(borderRadius ?? Dimens.defaultPaddingValue),
    );
  }
}
