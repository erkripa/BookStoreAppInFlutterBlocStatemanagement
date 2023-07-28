import 'package:kahani_box/utils/app_colors.dart';
import 'package:kahani_box/utils/dimens.dart';
import 'package:kahani_box/utils/styles/app_text_style.dart';
import 'package:kahani_box/utils/styles/decorations.dart';
import 'package:kahani_box/widgets/common/primary_icon_btn.dart';
import 'package:kahani_box/widgets/common/ripple_effect.dart';
import 'package:flutter/material.dart';

class AyushListTile extends StatelessWidget {
  const AyushListTile({
    Key? key,
    this.icon,
    this.title,
    this.onTap,
    this.subTitle,
    this.iconBgColor,
    this.iconColor,
  }) : super(key: key);

  final IconData? icon;
  final String? title;
  final VoidCallback? onTap;
  final String? subTitle;
  final Color? iconBgColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return RippleEffect(
      onTap: onTap,
      child: Ink(
        decoration: KDecoration.dynamickBoxDecoration(context),
        child: ListTile(
          leading: icon != null ? buildLeading(context) : null,
          minVerticalPadding: 0,
          dense: true,
          visualDensity: VisualDensity.compact,
          contentPadding: Dimens.defaultPadding.copyWith(bottom: 0, top: 0),
          title:
              title != null ? Text(title!, style: AppStyles.style14Bold) : null,
          subtitle: subTitle != null
              ? Text(subTitle!, style: AppStyles.style12Normal)
              : null,
        ),
      ),
    );
  }

  AyushIconButton buildLeading(BuildContext context) {
    return AyushIconButton(
      icon: icon,
      bgColor: iconBgColor ?? Theme.of(context).primaryColor.withOpacity(0.7),
      iconColor: iconColor ?? Theme.of(context).iconTheme.color,
      isEnabled: false,
      disabledColor: AppColors.whiteColor,
      borderWidth: 0.5,
    );
  }
}
