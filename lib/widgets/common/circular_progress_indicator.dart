import 'package:kahani_box/utils/app_colors.dart';
import 'package:kahani_box/utils/dimens.dart';
import 'package:flutter/material.dart';

class AyushCircularProgressIndicator extends StatelessWidget {
  const AyushCircularProgressIndicator({
    Key? key,
    this.size,
    this.strokeWidth,
    this.color,
    this.value,
  }) : super(key: key);

  final double? size;
  final double? strokeWidth;
  final Color? color;
  final double? value;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size ?? Dimens.sixTeen,
        height: size ?? Dimens.sixTeen,
        child: CircularProgressIndicator(
          strokeWidth: strokeWidth ?? Dimens.three,
          color: color ?? AppColors.primaryColor,
          value: value,
        ),
      ),
    );
  }
}
