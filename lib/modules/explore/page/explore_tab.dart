import 'package:flutter/material.dart';
import 'package:kahani_box/models/book/book_model.dart';
import 'package:kahani_box/models/menu/menu.dart';
import 'package:kahani_box/routes/route_management.dart';
import 'package:kahani_box/utils/dimens.dart';
import 'components/books_category_delegates.dart';
import 'components/explore_appbar.dart';
import 'components/explore_banners.dart';
import 'components/book_category_item.dart';
import 'components/book_item.dart';

class ExploreTab extends StatefulWidget {
  const ExploreTab({Key? key}) : super(key: key);

  @override
  State<ExploreTab> createState() => _ExploreTabState();
}

class _ExploreTabState extends State<ExploreTab> {
  final ScrollController scrollController = ScrollController();
  int selectedCategoryIndex = 0;
  List<double> breackPoints = [];
  double bannerWithAppBarheight = 200 //appbar height
      +
      170 //baners height
      -
      kToolbarHeight;

//When catgory tap to scroll
  void scrollToCategory(int index) {
    if (selectedCategoryIndex != index) {
      int totalItems = 0;
      for (var i = 0; i < index; i++) {
        totalItems += demoCategoryBooks[i].items.length;
      }
      final bookItemHeight = Dimens.oneHundredTen + Dimens.eight;
      final titleFontSizeAndBottomHeight = Dimens.fifteen + Dimens.thirtyTwo;
      scrollController.animateTo(
        bannerWithAppBarheight +
            (bookItemHeight * totalItems) +
            (titleFontSizeAndBottomHeight * index),
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );

      setState(() {
        selectedCategoryIndex = index;
      });
    }
  }

//Scroll To select Categories

  void createBreackPoints() {
    final bookItemHeight = Dimens.oneHundredTen + Dimens.eight;
    final titleFontSizeAndBottomHeight = Dimens.fifteen + Dimens.thirtyTwo;

    double firstBreackPoint = bannerWithAppBarheight +
        titleFontSizeAndBottomHeight +
        (bookItemHeight * demoCategoryBooks[0].items.length);

    breackPoints.add(firstBreackPoint);

    for (var i = 1; i < demoCategoryBooks.length; i++) {
      double breackPoint = breackPoints.last +
          titleFontSizeAndBottomHeight +
          (bookItemHeight * demoCategoryBooks[i].items.length);
      breackPoints.add(breackPoint);
    }
  }

//
  void updateCategoryIndexOnScroll(double offset) {
    for (var i = 0; i < demoCategoryBooks.length; i++) {
      if (i == 0) {
        if ((offset < breackPoints.first) & (selectedCategoryIndex != 0)) {
          setState(() {
            selectedCategoryIndex = 0;
          });
        }
      } else if ((breackPoints[i - 1] <= offset) & (offset < breackPoints[i])) {
        if (selectedCategoryIndex != i) {
          setState(() {
            selectedCategoryIndex = i;
          });
        }
      }
    }
  }

  @override
  void initState() {
    createBreackPoints();
    scrollController.addListener(listener);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.removeListener(listener);
    scrollController.dispose();
    super.dispose();
  }

  void listener() => updateCategoryIndexOnScroll(scrollController.offset);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          const ExploreSilverAppBar(),
          const ExploreBanners(),
          SliverPersistentHeader(
            pinned: true,
            delegate: BooksCategoriesDelegates(
              categories: demoCategoryBooks,
              onChanged: scrollToCategory,
              selectedIndex: selectedCategoryIndex,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: demoCategoryBooks.length,
              (context, categoryIndex) {
                final List<Book> books = demoCategoryBooks[categoryIndex].items;
                return BookCategoryItem(
                  title: demoCategoryBooks[categoryIndex].category,
                  items: List.generate(
                    books.length,
                    (index) {
                      final book = books[index];
                      return BookItem(
                        model: book,
                        onBookTap: () =>
                            RouteManagement.goToBookDetailPage(context),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
