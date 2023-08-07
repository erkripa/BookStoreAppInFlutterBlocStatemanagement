import 'package:flutter/material.dart';
import 'package:kahani_box/utils/dimens.dart';
import 'package:kahani_box/utils/styles/app_text_style.dart';

class BookCategoryItem extends StatelessWidget {
  const BookCategoryItem({
    super.key,
    required this.title,
    required this.items,
  });

  final String title;
  final List<Widget> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Dimens.defaultPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppStyles.style15Bold,
          ),
          Dimens.boxHeight10,
          ...items,
        ],
      ),
    );
  }
}
