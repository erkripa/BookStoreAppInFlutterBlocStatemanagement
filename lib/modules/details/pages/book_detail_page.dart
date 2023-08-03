import 'package:flutter/material.dart';
import 'package:kahani_box/utils/app_colors.dart';
import 'package:kahani_box/utils/dimens.dart';
import 'package:kahani_box/widgets/common/primary_filled_btn.dart';

import 'components/image_and_icons.dart';
import 'components/title_and_price.dart';

class BookDetailPage extends StatelessWidget {
  const BookDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const ImageAndIcons(),
            const TitleAndPrice(
                title: "Angelica", country: "Russia", price: 440),
            Dimens.boxHeight10,
            Row(
              children: <Widget>[
                SizedBox(
                  width: size.width / 2,
                  height: Dimens.fiftyFive,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                        ),
                      ),
                      backgroundColor: AppColors.primaryColor,
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Buy Now",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: AyushFilledButton(
                    size: Dimens.fiftyFive,
                    label: "Descriptions",
                    onTap: () {},
                    bgColor: AppColors.whiteColor,
                    elevation: 0,
                    labelColor: Theme.of(context).primaryColor,
                    fontSize: Dimens.f16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
