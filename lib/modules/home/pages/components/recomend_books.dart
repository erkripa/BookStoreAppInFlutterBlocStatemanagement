import 'package:flutter/material.dart';
import 'package:kahani_box/modules/home/pages/components/recommended_book_card.dart';
import 'package:kahani_box/routes/route_management.dart';

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
            image: "assets/images/dummy/1.jpg",
            title: "Samantha",
            country: "Russia",
            price: 440,
            press: () => RouteManagement.goToBookDetailPage(context),
          ),
          RecomendBookCard(
            image: "assets/images/dummy/2.jpg",
            title: "Angelica",
            country: "Russia",
            price: 440,
            press: () {},
          ),
          RecomendBookCard(
            image: "assets/images/dummy/1.jpg",
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
