import 'package:kahani_box/utils/app_colors.dart';
import 'package:kahani_box/utils/dimens.dart';
import 'package:kahani_box/utils/styles/app_text_style.dart';
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
    this.enabled = true,
    this.size,
    this.child,
    this.isCircle = false,
    this.borderWidth,
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
  final bool enabled;
  final double? size;
  final Widget? child;
  final bool isCircle;
  final double? borderWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: ElevatedButton(
        onPressed: enabled == true ? onTap : null,
        style: ElevatedButton.styleFrom(
          padding: padding ?? EdgeInsets.zero,
          shape: isCircle ? null : rectangleShape,
          maximumSize: size != null ? Size.square(size!) : null,
          minimumSize: size != null ? Size.square(size!) : null,
          backgroundColor: Theme.of(context).primaryColor,
          disabledBackgroundColor: Colors.white,
          side: borderWidth == null
              ? BorderSide.none
              : BorderSide(
                  width: borderWidth!,
                  color: AppColors.grayshade,
                  style: BorderStyle.solid,
                ),
          elevation: 4,
          visualDensity: VisualDensity.adaptivePlatformDensity,
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
              style: AppStyles.style14Bold
                  .copyWith(
                    color: enabled == true
                        ? labelColor ??
                            Theme.of(context).textTheme.titleLarge!.color
                        : Theme.of(context).disabledColor,
                  )
                  .merge(labelStyle)
                  .copyWith(fontSize: fontSize),
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
