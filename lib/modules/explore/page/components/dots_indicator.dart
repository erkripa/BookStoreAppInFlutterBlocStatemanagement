import 'package:flutter/material.dart';
import 'package:kahani_box/utils/dimens.dart';
import 'package:kahani_box/utils/styles/app_text_style.dart';

class IndicatorDots extends StatelessWidget {
  const IndicatorDots({
    this.isActive = false,
    Key? key,
  }) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimens.four,
      width: Dimens.ten,
      margin: Dimens.defaultPadding / 4,
      decoration: BoxDecoration(
        borderRadius: Dimens.defaultBoderRadius,
        color: isActive
            ? Theme.of(context).primaryColor
            : Theme.of(context).cardColor,
        boxShadow: AppStyles.defaultShadow,
      ),
    );
  }
}
