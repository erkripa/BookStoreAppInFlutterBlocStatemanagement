import 'package:kahani_box/utils/app_colors.dart';
import 'package:kahani_box/utils/dimens.dart';
import 'package:flutter/material.dart';

class AnimatedBar extends StatelessWidget {
  const AnimatedBar({
    Key? key,
    required this.isActive,
  }) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: Dimens.onlyBottom12,
      duration: const Duration(milliseconds: 500),
      height: Dimens.four,
      width: isActive ? Dimens.twenty : Dimens.zero,
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
