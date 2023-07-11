import 'package:course_app/utils/dimens.dart';
import 'package:course_app/utils/styles/app_text_style.dart';
import 'package:flutter/material.dart';

class AyushTextButton extends StatelessWidget {
  final String? label;
  final VoidCallback? onTap;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final TextStyle? labelStyle;
  final bool? enabled;
  final Color? textColor;
  final double? borderRadius;
  final double? size;
  final Widget? child;
  final bool isCircle;

  const AyushTextButton({
    Key? key,
    this.label,
    this.onTap,
    this.padding,
    this.margin,
    this.labelStyle,
    this.enabled = true,
    this.textColor,
    this.borderRadius,
    this.size,
    this.child,
    this.isCircle = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: TextButton(
        onPressed: enabled == true ? onTap : null,
        style: TextButton.styleFrom(
          padding: padding ?? EdgeInsets.zero,
          shape: isCircle ? null : rectangleShape,
          maximumSize: size != null ? Size.square(size!) : null,
          minimumSize: size != null ? Size.square(size!) : null,
        ),
        child: label != null
            ? Text(
                label!,
                style: AppStyles.style14Bold
                    .copyWith(
                        color: textColor ?? Theme.of(context).primaryColor)
                    .merge(labelStyle),
              )
            : const SizedBox(),
      ),
    );
  }

  RoundedRectangleBorder get rectangleShape {
    return RoundedRectangleBorder(
      borderRadius:
          BorderRadius.circular(borderRadius ?? Dimens.defaultPaddingValue),
    );
  }
}
