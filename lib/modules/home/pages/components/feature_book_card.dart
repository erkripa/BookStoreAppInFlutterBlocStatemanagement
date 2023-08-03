import 'package:flutter/material.dart';
import 'package:kahani_box/utils/dimens.dart';

class FeaturePlantCard extends StatelessWidget {
  const FeaturePlantCard({
    Key? key,
    this.image,
    this.press,
  }) : super(key: key);

  final String? image;
  final Function()? press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: Dimens.edgeL20T10B10,
        width: Dimens.screenWidth * 0.8,
        height: Dimens.h185,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(image!),
          ),
        ),
      ),
    );
  }
}
