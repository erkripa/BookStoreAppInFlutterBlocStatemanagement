import 'package:flutter/material.dart';
import 'package:kahani_box/models/book/book_model.dart';
import 'package:kahani_box/utils/dimens.dart';
import 'package:kahani_box/utils/styles/app_text_style.dart';
import 'package:kahani_box/widgets/common/ripple_effect.dart';

class BookItem extends StatelessWidget {
  const BookItem({super.key, this.model, this.onBookTap});

  final Book? model;
  final VoidCallback? onBookTap;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var theme = Theme.of(context);
    return Container(
      margin: Dimens.onlyBottom8,
      child: Container(
        decoration: _itemDecoration(context),
        child: RippleEffect(
          onTap: onBookTap,
          child: Ink(
            child: Row(
              children: [
                Container(
                  height: Dimens.oneHundredTen,
                  width: Dimens.oneHundredTen,
                  decoration: BoxDecoration(
                    borderRadius: Dimens.circularBorderRadius,
                    image: const DecorationImage(
                      image: AssetImage('assets/images/dummy/1.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: Dimens.defaultPadding,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "One Hundred Years of Solitude",
                          style: AppStyles.style14Bold
                              .copyWith(color: textTheme.bodyLarge?.color),
                        ),
                        Dimens.boxHeight4,
                        Text(
                          "One of the 20th century's enduring works, One Hundred Years of Solitude is a widely beloved and acclaimed novel known throughout the world",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: AppStyles.style12Normal
                              .copyWith(color: textTheme.bodySmall?.color),
                        ),
                        Dimens.boxHeight4,
                        Row(
                          children: [
                            Text(
                              "- By Ayush Dev",
                              style: AppStyles.style12Bold
                                  .copyWith(color: textTheme.bodyMedium?.color),
                            ),
                            const Spacer(),
                            Text(
                              "₹ 450/-",
                              style: AppStyles.style14Bold
                                  .copyWith(color: theme.primaryColor),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _itemDecoration(BuildContext context) {
    return BoxDecoration(
      color: Theme.of(context).cardColor,
      borderRadius: Dimens.circularBorderRadius,
      boxShadow: AppStyles.defaultShadow,
    );
  }
}
