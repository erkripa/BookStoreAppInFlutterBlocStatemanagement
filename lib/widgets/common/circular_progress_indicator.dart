import 'package:course_app/utils/app_colors.dart';
import 'package:course_app/utils/dm.dart';
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
        width: size ?? Dm.sixTeen,
        height: size ?? Dm.sixTeen,
        child: CircularProgressIndicator(
          strokeWidth: strokeWidth ?? Dm.three,
          color: color ?? AppColors.primaryColor,
          value: value,
        ),
      ),
    );
  }
}
