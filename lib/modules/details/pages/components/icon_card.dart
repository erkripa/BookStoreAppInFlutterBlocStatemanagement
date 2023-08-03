import 'package:flutter/material.dart';
import 'package:kahani_box/utils/app_colors.dart';
import 'package:kahani_box/utils/dimens.dart';
import 'package:kahani_box/widgets/common/primary_icon_btn.dart';

class IconCard extends StatelessWidget {
  const IconCard({
    Key? key,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.03),
      height: Dimens.fifty,
      width: Dimens.fifty,
      decoration: decoration(),
      child: AyushIconButton(
        onTap: () {},
        child: Icon(
          icon,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }

  BoxDecoration decoration() {
    return BoxDecoration(
      color: AppColors.backgroundColor,
      borderRadius: BorderRadius.circular(6),
      boxShadow: [
        BoxShadow(
          offset: const Offset(0, 15),
          blurRadius: 22,
          color: AppColors.primaryColor.withOpacity(0.22),
        ),
        const BoxShadow(
          offset: Offset(-15, -15),
          blurRadius: 20,
          color: Colors.white,
        ),
      ],
    );
  }
}
