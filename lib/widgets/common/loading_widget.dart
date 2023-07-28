import 'package:kahani_box/utils/dimens.dart';
import 'package:kahani_box/utils/styles/app_text_style.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
    this.isStyle1 = false,
    this.textColor,
    this.size,
  }) : super(key: key);
  final bool isStyle1;
  final double? size;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    if (isStyle1) {
      return Center(
        child: Container(
          padding: EdgeInsets.all(Dimens.h10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).progressIndicatorTheme.color!),
                strokeWidth: 3,
              ),
              Dimens.boxHeight10,
              Text(
                'Please wait..',
                style: AppStyles.style12Bold.copyWith(
                    color: textColor ??
                        Theme.of(context).textTheme.bodyLarge?.color),
              )
            ],
          ),
        ),
      );
    }

    return Center(
      child: SizedBox(
        height: size ?? height * 0.035,
        width: size ?? height * 0.035,
        child: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).progressIndicatorTheme.color!),
            strokeWidth: 1.5,
          ),
        ),
      ),
    );
  }
}
