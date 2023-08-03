import 'package:kahani_box/modules/home/pages/components/featurred_books.dart';
import 'package:kahani_box/modules/home/pages/components/header_with_seachbox.dart';
import 'package:kahani_box/modules/home/pages/components/recomend_books.dart';
import 'package:kahani_box/utils/dimens.dart';
import 'package:kahani_box/widgets/common/custom_app_bar.dart';
import 'package:kahani_box/widgets/common/primary_icon_btn.dart';
import 'package:flutter/material.dart';

import 'components/title_with_more_bbtn.dart';

class HomeTabView extends StatelessWidget {
  const HomeTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AyushAppBar(
        backBtnColor: Colors.white,
        leadingIcon: Icons.menu_open_outlined,
        actions: [
          AyushIconButton(
            onTap: () {},
            iconColor: Colors.white,
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
                const HeaderWithSearchBox(),
                TitleWithMoreBtn(title: "Recomended Books", press: () {}),
                const RecomendsPlants(),
                TitleWithMoreBtn(title: "Featured Books", press: () {}),
                const FeaturedBooks(),
                Dimens.boxHeight20,
              ],
            ),
          )
        ],
      ),
    );
  }
}
