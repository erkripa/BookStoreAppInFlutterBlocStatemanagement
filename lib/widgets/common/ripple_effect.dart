import 'package:kahani_box/utils/app_colors.dart';
import 'package:kahani_box/utils/dimens.dart';
import 'package:flutter/material.dart';

class RippleEffect extends StatelessWidget {
  const RippleEffect({Key? key, this.onTap, required this.child, this.radius})
      : super(key: key);

  final VoidCallback? onTap;
  final Widget child;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.transparent,
      borderRadius: Dimens.defaultBoderRadius,
      child: InkWell(
        splashColor: AppColors.primaryColor.withOpacity(0.2),
        borderRadius: radius == null
            ? Dimens.defaultBoderRadius
            : BorderRadius.circular(radius!),
        onTap: onTap,
        child: Ink(child: child),
      ),
    );
  }
}
