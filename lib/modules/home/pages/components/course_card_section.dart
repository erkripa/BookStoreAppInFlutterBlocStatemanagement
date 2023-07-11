import 'package:course_app/assets/app_assets.dart';
import 'package:course_app/utils/dimens.dart';
import 'package:course_app/utils/styles/app_text_style.dart';
import 'package:course_app/utils/styles/decorations.dart';
import 'package:flutter/material.dart';

class CourseCardSection extends StatelessWidget {
  const CourseCardSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: Dimens.defaultPadding,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 6,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: Dimens.four,
        crossAxisSpacing: Dimens.four,
        childAspectRatio: 1.6,
      ),
      itemBuilder: (context, index) => buildCourseCard(context),
    );
  }

  Container buildCourseCard(BuildContext context) {
    return Container(
      decoration: KDecoration.boxDecoration.copyWith(
        image: const DecorationImage(
            image: AssetImage(Assets.banners3), fit: BoxFit.cover),
      ),
      child: Padding(
        padding: Dimens.defaultPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Best course for IT ",
              style: AppStyles.style14Bold.copyWith(
                color: Theme.of(context).textTheme.titleLarge?.color,
              ),
            ),
            Text(
              "Flutter Best Course ",
              style: AppStyles.style14Bold.copyWith(
                color: Theme.of(context).textTheme.titleLarge?.color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
