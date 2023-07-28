import 'package:kahani_box/utils/dimens.dart';
import 'package:kahani_box/utils/styles/app_text_style.dart';
import 'package:kahani_box/utils/styles/decorations.dart';
import 'package:flutter/material.dart';

class RoundedCardWithIcon extends StatelessWidget {
  const RoundedCardWithIcon({
    Key? key,
    this.title,
    this.icon,
    this.onTap,
  }) : super(key: key);

  final String? title;
  final IconData? icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimens.sixty,
      width: Dimens.hundred,
      alignment: Alignment.center,
      decoration: KDecoration.boxDecoration
          .copyWith(color: Theme.of(context).primaryColor),
      child: Column(
        children: [
          if (icon != null) Dimens.boxHeight6,
          if (icon != null)
            Icon(
              icon!,
              color: Theme.of(context).textTheme.titleLarge?.color,
            ),
          if (title != null) Dimens.boxHeight4,
          if (title != null)
            Text(
              title!,
              style: AppStyles.style12Bold.copyWith(
                  color: Theme.of(context).textTheme.titleLarge?.color),
            ),
        ],
      ),
    );
  }
}
