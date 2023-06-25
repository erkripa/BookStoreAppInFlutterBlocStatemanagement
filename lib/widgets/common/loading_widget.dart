import 'package:course_app/utils/dm.dart';
import 'package:course_app/utils/styles/app_text_style.dart';
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
          padding: EdgeInsets.all(Dm.h10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).progressIndicatorTheme.color!),
                strokeWidth: 3,
              ),
              Dm.boxHeight10,
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
