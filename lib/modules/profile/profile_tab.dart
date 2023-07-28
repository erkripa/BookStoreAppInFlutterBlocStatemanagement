import 'package:kahani_box/assets/app_assets.dart';
import 'package:kahani_box/modules/profile/components/profile_actions_card.dart';
import 'package:kahani_box/utils/app_colors.dart';
import 'package:kahani_box/utils/dimens.dart';
import 'package:kahani_box/utils/styles/decorations.dart';
import 'package:kahani_box/widgets/common/custom_app_bar.dart';
import 'package:kahani_box/widgets/common/primary_icon_btn.dart';
import 'package:kahani_box/widgets/custom/custom_list_tile.dart';
import 'package:flutter/material.dart';

class ProfileTabView extends StatelessWidget {
  const ProfileTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AyushAppBar(
        title: "Profile",
        titleCenter: true,
        leadingIcon: Icons.menu,
        actions: [
          AyushIconButton(
            icon: Icons.more_vert_rounded,
            onTap: () {},
          )
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                //profile pic
                Center(
                  child: Container(
                    alignment: Alignment.bottomRight,
                    height: Dimens.eighty,
                    width: Dimens.eighty,
                    decoration: KDecoration.boxDecoration.copyWith(
                      image: const DecorationImage(
                          image: AssetImage(Assets.banners3),
                          fit: BoxFit.cover),
                    ),
                    child: AyushIconButton(
                      icon: Icons.edit,
                      iconColor: AppColors.whiteColor,
                      onTap: () {},
                      borderWidth: 0.5,
                      iconSize: Dimens.f18,
                      size: Dimens.twentyFive,
                    ),
                  ),
                ),
                //profile action card
                const ProfileActionsCard(),

                AyushListTile(
                  icon: Icons.settings_rounded,
                  title: "Achievement",
                  subTitle: "See your achievement",
                  onTap: () {},
                ),
                AyushListTile(
                  icon: Icons.settings_rounded,
                  title: "Payment Details",
                  subTitle: "See your payment details",
                  onTap: () {},
                ),

                AyushListTile(
                  icon: Icons.favorite_rounded,
                  title: "Love",
                  subTitle: "See your love",
                  onTap: () {},
                ),

                AyushListTile(
                  icon: Icons.diamond_rounded,
                  title: "Learning Reminder",
                  subTitle: "See your love",
                  onTap: () {},
                ),
                AyushListTile(
                  icon: Icons.settings_rounded,
                  title: "Settings",
                  subTitle: "Change Password,Logout",
                  onTap: () {},
                ),
                AyushListTile(
                  icon: Icons.settings_rounded,
                  title: "Settings",
                  subTitle: "Change Password,Logout",
                  onTap: () {},
                ),

                AyushListTile(
                  icon: Icons.settings_rounded,
                  title: "Settings",
                  subTitle: "Change Password,Logout",
                  onTap: () {},
                ),
                AyushListTile(
                  icon: Icons.settings_rounded,
                  title: "Settings",
                  subTitle: "Change Password,Logout",
                  onTap: () {},
                ),
                AyushListTile(
                  icon: Icons.settings_rounded,
                  title: "Settings",
                  subTitle: "Change Password,Logout",
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
