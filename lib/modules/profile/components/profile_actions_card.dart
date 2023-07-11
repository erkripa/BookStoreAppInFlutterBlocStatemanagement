import 'package:course_app/modules/profile/components/rounded_card.dart';
import 'package:course_app/utils/dimens.dart';
import 'package:flutter/material.dart';

class ProfileActionsCard extends StatelessWidget {
  const ProfileActionsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Dimens.defaultPadding,
      margin: Dimens.edgeInsetsOnlyTop16,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RoundedCardWithIcon(
            title: "My Courses",
            icon: Icons.video_library_rounded,
          ),
          RoundedCardWithIcon(
            title: "Buy Courses",
            icon: Icons.bloodtype_rounded,
          ),
          RoundedCardWithIcon(
            title: "4.9",
            icon: Icons.star_rounded,
          ),
        ],
      ),
    );
  }
}
