import 'package:flutter/material.dart';
import 'package:kahani_box/utils/app_colors.dart';
import 'package:kahani_box/utils/dimens.dart';
import 'package:kahani_box/utils/styles/app_text_style.dart';
import 'package:kahani_box/widgets/common/primary_filled_btn.dart';

class TitleWithMoreBtn extends StatelessWidget {
  const TitleWithMoreBtn({
    Key? key,
    this.title,
    this.press,
  }) : super(key: key);

  final String? title;
  final Function()? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Dimens.edgeHoriz10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          TitleWithCustomUnderline(text: title!),
          const Spacer(),
          AyushFilledButton(
            label: "More",
            onTap: () {},
            enabled: true,
          )
        ],
      ),
    );
  }
}

class TitleWithCustomUnderline extends StatelessWidget {
  const TitleWithCustomUnderline({
    Key? key,
    this.text,
  }) : super(key: key);

  final String? text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimens.twentyFour,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: Dimens.onlyLeft5,
            child: Text(text!, style: AppStyles.style20Bold),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: Dimens.onlyLeft5,
              height: Dimens.two,
              color: AppColors.primaryColor.withOpacity(0.2),
            ),
          )
        ],
      ),
    );
  }
}
