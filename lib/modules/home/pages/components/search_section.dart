import 'package:course_app/utils/app_colors.dart';
import 'package:course_app/utils/dimens.dart';
import 'package:course_app/utils/styles/app_text_style.dart';
import 'package:course_app/utils/styles/decorations.dart';
import 'package:course_app/widgets/common/primary_icon_btn.dart';
import 'package:flutter/material.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Dimens.boxHeight10,
        Container(
          margin: Dimens.defaultPadding,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: Dimens.fourtyTwo,
                  decoration: KDecoration.boxDecoration,
                  padding: Dimens.edgeInsetsOnlyLeft8,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Search Here..",
                      style: AppStyles.style13Normal
                          .copyWith(color: Theme.of(context).disabledColor),
                    ),
                  ),
                ),
              ),
              Dimens.boxWidth10,
              AyushIconButton(
                bgColor: AppColors.whiteColor,
                onTap: () {},
                icon: Icons.sort_outlined,
                size: Dimens.fourtyTwo,
                borderWidth: 0.5,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
