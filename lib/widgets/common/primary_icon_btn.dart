import 'package:kahani_box/utils/app_colors.dart';
import 'package:kahani_box/utils/dimens.dart';
import 'package:flutter/material.dart';

class AyushIconButton extends StatelessWidget {
  final IconData? icon;
  final VoidCallback? onTap;
  final Color? iconColor;
  final double? iconSize;
  final Color? bgColor;
  final Color? disabledColor;
  final EdgeInsets? padding;
  final double? borderRadius;
  final double? size;
  final Widget? child;
  final bool isCircle;
  final bool isEnabled;
  final double? borderWidth;

  const AyushIconButton({
    Key? key,
    this.icon,
    this.onTap,
    this.iconColor,
    this.bgColor,
    this.padding,
    this.iconSize,
    this.borderRadius,
    this.child,
    this.size,
    this.isCircle = false,
    this.isEnabled = true,
    this.disabledColor,
    this.borderWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      iconSize: iconSize ?? Dimens.twentyFour,
      style: IconButton.styleFrom(
        padding: padding ?? EdgeInsets.zero,
        backgroundColor: bgColor,
        shape: isCircle ? null : rectangleShape,
        maximumSize: size != null ? Size.square(size!) : null,
        minimumSize: size != null ? Size.square(size!) : null,
        disabledBackgroundColor: isEnabled == false ? disabledColor : null,
      ),
      icon: child ??
          Icon(
            icon,
            color: iconColor ?? Theme.of(context).iconTheme.color,
          ),
    );
  }

  RoundedRectangleBorder get rectangleShape {
    return RoundedRectangleBorder(
      side: borderWidth == null
          ? BorderSide.none
          : BorderSide(
              width: borderWidth!,
              color: AppColors.grayshade,
              style: BorderStyle.solid,
            ),
      borderRadius:
          BorderRadius.circular(borderRadius ?? Dimens.defaultPaddingValue),
    );
  }
}
