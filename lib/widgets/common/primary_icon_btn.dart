import 'package:course_app/utils/dm.dart';
import 'package:flutter/material.dart';

class AyushIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final Color? iconColor;
  final double? iconSize;
  final Color? bgColor;
  final EdgeInsets? padding;
  final double? borderRadius;
  final double? width;
  final bool? centerIcon;
  final double? height;

  const AyushIconButton({
    Key? key,
    required this.icon,
    required this.onTap,
    this.iconColor,
    this.bgColor,
    this.padding,
    this.iconSize,
    this.borderRadius,
    this.width,
    this.height,
    this.centerIcon = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: padding ?? Dm.edgeInsets0,
        decoration: BoxDecoration(
          color: bgColor ?? Colors.transparent,
          borderRadius: BorderRadius.all(
            Radius.circular(
              borderRadius ?? Dm.zero,
            ),
          ),
        ),
        child: centerIcon!
            ? Center(
                child: Icon(
                  icon,
                  size: iconSize ?? Dm.twentyFour,
                  color: iconColor ?? Theme.of(context).iconTheme.color,
                ),
              )
            : Icon(
                icon,
                size: iconSize ?? Dm.twentyFour,
                color: iconColor ?? Theme.of(context).iconTheme.color,
              ),
      ),
    );
  }
}
