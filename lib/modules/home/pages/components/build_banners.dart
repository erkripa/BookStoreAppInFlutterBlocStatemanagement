import 'package:course_app/constants/widget_constant.dart';
import 'package:course_app/modules/home/bloc/home_bloc.dart';
import 'package:course_app/utils/dimens.dart';
import 'package:course_app/utils/styles/decorations.dart';
import 'package:course_app/widgets/common/asset_image.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BannerView extends StatelessWidget {
  const BannerView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final homeBloc = context.read<HomeBloc>();
        return Column(
          children: [
            SizedBox(
              height: Dimens.h220,
              child: PageView(
                onPageChanged: (index) =>
                    homeBloc.add(BannerChange(index: index)),
                children: List.generate(
                  WidgetConstant.homeBanners.length,
                  (index) {
                    final banner = WidgetConstant.homeBanners[index];
                    return Padding(
                      padding: Dimens.defaultPadding,
                      child: AyushAssetImage(imgAsset: banner),
                    );
                  },
                ),
              ),
            ),
            DotsIndicator(
              dotsCount: WidgetConstant.homeBanners.length,
              position: state.dotIndex,
              decorator: KDecoration.dotsDecoration1(context),
            )
          ],
        );
      },
    );
  }
}
