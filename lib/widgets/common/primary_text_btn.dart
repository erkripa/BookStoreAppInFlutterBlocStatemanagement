import 'package:course_app/utils/app_colors.dart';
import 'package:course_app/utils/dm.dart';
import 'package:course_app/utils/styles/app_text_style.dart';
import 'package:flutter/material.dart';

class ASTextButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final TextStyle? labelStyle;
  final bool? enabled;

  const ASTextButton({
    Key? key,
    required this.label,
    required this.onTap,
    this.padding,
    this.margin,
    this.labelStyle,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled == true ? onTap : () {},
      child: Container(
        padding: padding ?? Dm.edgeInsets0,
        margin: margin ?? Dm.edgeInsets0,
        child: Text(
          label,
          style: labelStyle ??
              AppStyles.style16Bold.copyWith(
                color: enabled == true
                    ? AppColors.linkColor
                    : Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .color!
                        .withAlpha(50),
              ),
        ),
      ),
    );
  }
}
