import 'package:course_app/utils/dimens.dart';
import 'package:course_app/utils/styles/app_text_style.dart';
import 'package:course_app/widgets/common/custom_app_bar.dart';
import 'package:course_app/widgets/common/primary_icon_btn.dart';
import 'package:flutter/material.dart';

import 'components/build_banners.dart';
import 'components/search_section.dart';

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
      body: Container(
        color: Theme.of(context).cardColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: Dimens.defaultPadding,
              child: Text(
                "Hello,Ayush",
                style: AppStyles.style20Bold,
              ),
            ),
            //banners
            const BannerView(),
            //Search
            const SearchSection()
          ],
        ),
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
