import 'package:flutter/material.dart';
import 'feature_book_card.dart';

class FeaturedBooks extends StatelessWidget {
  const FeaturedBooks({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          FeaturePlantCard(
            image: "assets/images/dummy/5.jpg",
            press: () {},
          ),
          FeaturePlantCard(
            image: "assets/images/dummy/5.jpg",
            press: () {},
          ),
        ],
      ),
    );
  }
}
