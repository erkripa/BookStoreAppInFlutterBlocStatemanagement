import 'package:course_app/utils/dimens.dart';
import 'package:flutter/material.dart';

class AyushIconButton extends StatelessWidget {
  final IconData? icon;
  final VoidCallback onTap;
  final Color? iconColor;
  final double? iconSize;
  final Color? bgColor;
  final EdgeInsets? padding;
  final double? borderRadius;
  final double? size;
  final Widget? child;
  final bool isCircle;

  const AyushIconButton({
    Key? key,
    this.icon,
    required this.onTap,
    this.iconColor,
    this.bgColor,
    this.padding,
    this.iconSize,
    this.borderRadius,
    this.child,
    this.size,
    this.isCircle = false,
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
      borderRadius:
          BorderRadius.circular(borderRadius ?? Dimens.defaultPaddingValue),
    );
  }
}
