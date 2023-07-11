import 'package:course_app/utils/dimens.dart';
import 'package:course_app/utils/styles/app_text_style.dart';
import 'package:course_app/widgets/common/custom_app_bar.dart';
import 'package:course_app/widgets/common/primary_icon_btn.dart';
import 'package:flutter/material.dart';

import 'components/build_banners.dart';
import 'components/build_choice_heading.dart';
import 'components/course_card_section.dart';
import 'components/search_section.dart';

class HomeTabView extends StatelessWidget {
  const HomeTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AyushAppBar(
        leadingIcon: Icons.menu_open_outlined,
        actions: [
          AyushIconButton(
            onTap: () {},
            icon: Icons.account_circle_outlined,
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: Dimens.defaultPadding.copyWith(bottom: 0),
                  child: Text(
                    "Hello,Ayush",
                    style: AppStyles.style20Bold,
                  ),
                ),
                //Search
                const SearchSection(),
                //banners
                const BannerView(),
                //choice your courses
                const BuildChoiceHeading(),

                const CourseCardSection(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
