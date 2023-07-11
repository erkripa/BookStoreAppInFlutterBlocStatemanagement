import 'package:course_app/enums/enums.dart';
import 'package:course_app/utils/dimens.dart';
import 'package:course_app/widgets/common/primary_filled_btn.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildChoiceOptions extends StatelessWidget {
  const BuildChoiceOptions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AyushFilledButton(
          label: describeEnum(CourseChoice.all).capitalizeFirst!,
          padding: Dimens.defaultPadding.copyWith(right: Dimens.ten),
          margin: Dimens.defaultPadding
              .copyWith(right: Dimens.ten, left: 0, top: 0),
          onTap: () {},
          enabled: true,
          borderWidth: 0.5,
        ),
        AyushFilledButton(
          label: describeEnum(CourseChoice.populars).capitalizeFirst!,
          padding: Dimens.defaultPadding.copyWith(right: Dimens.ten),
          margin: Dimens.defaultPadding
              .copyWith(right: Dimens.ten, left: 0, top: 0),
          onTap: () {},
          enabled: false,
          borderWidth: 0.5,
        ),
        AyushFilledButton(
          label: describeEnum(CourseChoice.newest).capitalizeFirst!,
          padding: Dimens.defaultPadding.copyWith(right: Dimens.ten),
          margin: Dimens.defaultPadding
              .copyWith(right: Dimens.ten, left: 0, top: 0),
          onTap: () {},
          enabled: false,
          borderWidth: 0.5,
        )
      ],
    );
  }
}
