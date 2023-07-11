import 'package:course_app/modules/home/pages/components/build_choice_options.dart';
import 'package:course_app/utils/dimens.dart';
import 'package:course_app/utils/styles/app_text_style.dart';
import 'package:course_app/widgets/common/primary_text_btn.dart';
import 'package:flutter/material.dart';

class BuildChoiceHeading extends StatelessWidget {
  const BuildChoiceHeading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Dimens.defaultPadding.copyWith(bottom: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Choice Your Course",
                style: AppStyles.style14Bold,
              ),
              AyushTextButton(
                label: "See All",
                onTap: () {},
              ),
            ],
          ),
          const BuildChoiceOptions(),
        ],
      ),
    );
  }
}
