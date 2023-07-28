import 'package:flutter/material.dart';
import 'package:kahani_box/modules/home/pages/components/recommended_book_card.dart';

class RecomendsPlants extends StatelessWidget {
  const RecomendsPlants({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          RecomendBookCard(
            image: "assets/images/image_1.png",
            title: "Samantha",
            country: "Russia",
            price: 440,
            press: () {},
          ),
          RecomendBookCard(
            image: "assets/images/image_2.png",
            title: "Angelica",
            country: "Russia",
            price: 440,
            press: () {},
          ),
          RecomendBookCard(
            image: "assets/images/image_3.png",
            title: "Samantha",
            country: "Russia",
            price: 440,
            press: () {},
          ),
        ],
      ),
    );
  }
}
