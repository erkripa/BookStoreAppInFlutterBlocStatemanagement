import 'package:flutter/material.dart';
import 'package:kahani_box/utils/styles/app_text_style.dart';
import 'package:kahani_box/widgets/common/asset_image.dart';
import 'package:kahani_box/widgets/common/primary_text_btn.dart';

class ExploreSilverAppBar extends StatelessWidget {
  const ExploreSilverAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).textTheme.titleLarge?.color;
    return SliverAppBar(
      expandedHeight: 200,
      pinned: true,
      centerTitle: true,
      leading: BackButton(
        color: Theme.of(context).cardColor,
      ),
      flexibleSpace: const FlexibleSpaceBar(
        background: AyushAssetImage(
          imgAsset: "assets/images/dummy/f.jpg",
          fit: BoxFit.cover,
        ),
      ),
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
