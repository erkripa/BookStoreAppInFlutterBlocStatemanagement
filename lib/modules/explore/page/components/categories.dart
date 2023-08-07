import 'package:flutter/material.dart';
import 'package:kahani_box/models/book/book_model.dart';
import 'package:kahani_box/models/menu/menu.dart';
import 'package:kahani_box/utils/dimens.dart';
import 'package:kahani_box/utils/styles/app_text_style.dart';
import 'package:kahani_box/widgets/common/primary_text_btn.dart';

class Categories extends StatefulWidget {
  const Categories({
    Key? key,
    required this.onChanged,
    required this.selectedIndex,
    this.categories = const [],
  }) : super(key: key);

  final ValueChanged<int> onChanged;
  final int selectedIndex;
  final List<CategoryBook> categories;

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  late ScrollController _controller;
  @override
  void initState() {
    _controller = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant Categories oldWidget) {
    _controller.animateTo(
      80.0 * widget.selectedIndex,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 200),
    );
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _controller,
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          widget.categories.length,
          (index) => AyushTextButton(
            onTap: () {
              demoCategoryBooks[0].category;
              widget.onChanged(index);
              _controller.animateTo(
                80.0 * index,
                curve: Curves.ease,
                duration: const Duration(milliseconds: 200),
              );
            },
            label: widget.categories[index].category,
            padding: Dimens.defaultPadding,
            textColor: widget.selectedIndex == index
                ? Theme.of(context).textTheme.bodyLarge?.color
                : Colors.black45,
            labelStyle: AppStyles.style16Bold,
          ),
        ),
      ),
    );
  }
}
