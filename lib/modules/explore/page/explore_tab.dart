import 'package:flutter/material.dart';
import 'package:kahani_box/utils/dimens.dart';
import 'package:kahani_box/widgets/common/asset_image.dart';

import 'components/explore_appbar.dart';

class ExploreTab extends StatelessWidget {
  const ExploreTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const ExploreSilverAppBar(),
          SliverPadding(
            padding: Dimens.defaultPadding,
            sliver: SliverToBoxAdapter(
              child: AspectRatio(
                aspectRatio: 1.81,
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    PageView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return const AyushAssetImage(
                          imgAsset: 'assets/images/dummy/1.jpg',
                          fit: BoxFit.cover,
                          isRadius: true,
                        );
                      },
                    ),
                    Positioned(
                      bottom: Dimens.sixTeen,
                      right: Dimens.sixTeen,
                      child: Row(
                        children: List.generate(
                          4,
                          (index) => IndicatorDots(),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class IndicatorDots extends StatelessWidget {
  const IndicatorDots({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimens.four,
      width: Dimens.ten,
      margin: Dimens.defaultPadding / 4,
      decoration: BoxDecoration(
        borderRadius: Dimens.defaultBoderRadius,
        color: Theme.of(context).cardColor,
      ),
    );
  }
}
