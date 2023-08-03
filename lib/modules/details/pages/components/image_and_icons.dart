import 'package:flutter/material.dart';
import 'package:kahani_box/utils/app_colors.dart';
import 'package:kahani_box/utils/dimens.dart';

import 'icon_card.dart';

class ImageAndIcons extends StatelessWidget {
  const ImageAndIcons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: Dimens.defaultPaddingValue * 3),
      child: SizedBox(
        height: Dimens.screenHeight * 0.8,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: Dimens.edgeVert20,
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: Dimens.defaultPadding,
                        child: const BackButton(),
                      ),
                    ),
                    const Spacer(),
                    const IconCard(icon: Icons.favorite_border_outlined),
                    const IconCard(icon: Icons.thumb_up_alt_outlined),
                    const IconCard(icon: Icons.bookmark_outline_outlined),
                    const IconCard(icon: Icons.shopping_cart_outlined),
                  ],
                ),
              ),
            ),
            Container(
              height: Dimens.screenHeight * 0.8,
              width: Dimens.screenWidth * 0.75,
              margin: Dimens.onlyLeft12,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(63),
                  bottomLeft: Radius.circular(63),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 10),
                    blurRadius: 60,
                    color: AppColors.primaryColor.withOpacity(0.29),
                  ),
                ],
                image: const DecorationImage(
                  alignment: Alignment.centerLeft,
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/dummy/1.jpg"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
