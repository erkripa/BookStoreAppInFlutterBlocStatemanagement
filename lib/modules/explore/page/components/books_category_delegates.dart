import 'package:flutter/material.dart';
import 'package:kahani_box/models/book/book_model.dart';
import 'package:kahani_box/modules/explore/page/components/categories.dart';
import 'package:kahani_box/utils/dimens.dart';

class BooksCategoriesDelegates extends SliverPersistentHeaderDelegate {
  final ValueChanged<int> onChanged;
  final int selectedIndex;
  final List<CategoryBook> categories;

  BooksCategoriesDelegates({
    required this.onChanged,
    required this.selectedIndex,
    required this.categories,
  });
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: Dimens.fiftyFive,
      color: Theme.of(context).cardColor,
      child: Categories(
        onChanged: onChanged,
        selectedIndex: selectedIndex,
        categories: categories,
      ),
    );
  }

  @override
  double get maxExtent => Dimens.fiftyFive;

  @override
  double get minExtent => Dimens.fiftyFive;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
