import 'package:course_app/utils/dimens.dart';
import 'package:course_app/utils/styles/app_text_style.dart';
import 'package:course_app/widgets/common/primary_icon_btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AyushAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AyushAppBar({
    Key? key,
    this.title,
    this.showDivider = false,
    this.child,
    this.showBackBtn = true,
    this.padding,
    this.titleStyle,
    this.bgColor,
    this.backBtnColor,
    this.actions,
    this.leadingIcon,
    this.leading,
    this.titleCenter = false,
  }) : super(key: key);

  final String? title;
  final TextStyle? titleStyle;
  final bool? showDivider;
  final Widget? child;
  final Widget? leading;
  final Color? backBtnColor;
  final bool? showBackBtn;
  final bool titleCenter;
  final IconData? leadingIcon;
  final EdgeInsets? padding;
  final Color? bgColor;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: bgColor,
      titleSpacing: Dimens.zero,
      elevation: 0,
      forceMaterialTransparency: true,
      title: Row(
        mainAxisAlignment:
            titleCenter ? MainAxisAlignment.center : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          showBackBtn == true ? leading ?? buildLeading() : const SizedBox(),
          Expanded(
            child: Row(
              mainAxisAlignment: titleCenter
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (child != null) child!,
                if (child != null && title != null) Dimens.boxWidth16,
                if (title != null && title!.isNotEmpty)
                  Text(
                    title!,
                    style: titleStyle ??
                        AppStyles.style16Bold.copyWith(
                            color: Theme.of(context).textTheme.bodyLarge!.color,
                            fontFamily: AppStyles.defaultFontFamily2),
                  ),
              ],
            ),
          ),
        ],
      ),
      actions: actions,
    );
  }

  Widget buildLeading() {
    return AyushIconButton(
      onTap: () {},
      icon: GetPlatform.isAndroid
          ? leadingIcon ?? Icons.arrow_back_rounded
          : Icons.arrow_back_ios_new_rounded,
    );
  }

  @override
  Size get preferredSize => Size(0, Dimens.h10 * 5.6);
}
