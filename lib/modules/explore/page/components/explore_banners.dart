import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kahani_box/modules/explore/blocs/banners/exbanner_bloc.dart';
import 'package:kahani_box/utils/dimens.dart';
import 'package:kahani_box/widgets/common/asset_image.dart';

import 'dots_indicator.dart';

class ExploreBanners extends StatelessWidget {
  const ExploreBanners({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: Dimens.defaultPadding,
      sliver: SliverToBoxAdapter(
        child: AspectRatio(
          aspectRatio: 16 / 6,
          child: BlocBuilder<ExbannerBloc, ExbannerState>(
            builder: (context, state) {
              ExbannerBloc exBannerBloc = context.read<ExbannerBloc>();
              return Stack(
                alignment: Alignment.bottomRight,
                children: [
                  PageView.builder(
                    itemCount: 4,
                    onPageChanged: (newIndex) =>
                        exBannerBloc.add(OnBannerChangeEVent(index: newIndex)),
                    itemBuilder: (context, index) {
                      return const AyushAssetImage(
                        imgAsset: 'assets/images/dummy/5.jpg',
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
                        (index) => IndicatorDots(
                            isActive: index == state.currentIndex),
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
