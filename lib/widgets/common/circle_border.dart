import 'package:course_app/utils/app_colors.dart';
import 'package:course_app/utils/dm.dart';
import 'package:flutter/material.dart';

class AyushCircleBorder extends StatelessWidget {
  const AyushCircleBorder({
    super.key,
    this.child,
    this.radius,
    this.color,
    this.borderColor,
    this.borderWidth,
  });

  final Widget? child;
  final double? radius;
  final Color? color;
  final Color? borderColor;
  final double? borderWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius ?? Dm.thirtyTwo,
      height: radius ?? Dm.thirtyTwo,
      decoration: BoxDecoration(
        color: color ?? AppColors.transparent,
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor ?? Theme.of(context).dividerColor,
          width: borderWidth ?? Dm.one,
        ),
      ),
      child: Center(child: child),
    );
  }
}
