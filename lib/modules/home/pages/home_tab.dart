import 'package:course_app/assets/app_assets.dart';
import 'package:course_app/utils/dimens.dart';
import 'package:course_app/utils/styles/app_text_style.dart';
import 'package:course_app/utils/styles/decorations.dart';
import 'package:course_app/widgets/common/asset_image.dart';
import 'package:course_app/widgets/common/custom_app_bar.dart';
import 'package:course_app/widgets/common/primary_icon_btn.dart';
import 'package:flutter/material.dart';

class HomeTabView extends StatelessWidget {
  const HomeTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AyushAppBar(
        showBackBtn: false,
        leading: buildLeading(),
        actions: [
          AyushIconButton(
            onTap: () {},
            icon: Icons.account_circle_outlined,
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: KDecoration.dynamickBoxDecoration(context),
            child: Padding(
              padding: Dimens.defaultPadding,
              child: Text(
                "Hello,Ayush",
                style: AppStyles.style20Bold,
              ),
            ),
          ),
          //banners
          Container(
            height: 220,
            decoration: KDecoration.dynamickBoxDecoration(context),
            child: PageView(
              children: List.generate(
                3,
                (index) => Padding(
                    padding: Dimens.defaultPadding,
                    child: AyushAssetImage(imgAsset: Assets.banners1)),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildLeading() {
    return AyushIconButton(
      onTap: () {},
      icon: Icons.menu_open_outlined,
    );
  }
}
