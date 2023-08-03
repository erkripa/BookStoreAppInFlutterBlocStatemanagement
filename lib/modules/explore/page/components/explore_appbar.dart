import 'package:flutter/material.dart';
import 'package:kahani_box/utils/styles/app_text_style.dart';
import 'package:kahani_box/widgets/common/primary_text_btn.dart';

class ExploreSilverAppBar extends StatelessWidget {
  const ExploreSilverAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).textTheme.titleLarge?.color;
    return SliverAppBar(
      title: Column(
        children: [
          Text("Hi,Dude",
              style: AppStyles.style12Normal.copyWith(color: textColor)),
          Text(
            "Explore More Books",
            style: AppStyles.style16Bold.copyWith(color: textColor),
          ),
        ],
      ),
      actions: [
        AyushTextButton(
          label: "Filter",
          onTap: () {},
          textColor: Theme.of(context).textTheme.titleLarge?.color,
        )
      ],
    );
  }
}
