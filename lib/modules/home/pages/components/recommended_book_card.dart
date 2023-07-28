import 'package:flutter/material.dart';
import 'package:kahani_box/utils/app_colors.dart';
import 'package:kahani_box/utils/dimens.dart';

class RecomendBookCard extends StatelessWidget {
  const RecomendBookCard({
    Key? key,
    this.image,
    this.title,
    this.country,
    this.price,
    this.press,
  }) : super(key: key);

  final String? image, title, country;
  final int? price;
  final Function()? press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: Dimens.edgeL20T10B8,
      width: size.width * 0.4,
      child: Column(
        children: <Widget>[
          Image.asset(image!),
          GestureDetector(
            onTap: press,
            child: Container(
              padding: Dimens.edgeA10,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 10),
                    blurRadius: 50,
                    color: AppColors.primaryColor.withOpacity(0.23),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "$title\n".toUpperCase(),
                            style: Theme.of(context).textTheme.button),
                        TextSpan(
                          text: "$country".toUpperCase(),
                          style: TextStyle(
                            color: AppColors.primaryColor.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '\$$price',
                    style: Theme.of(context)
                        .textTheme
                        .button
                        ?.copyWith(color: AppColors.primaryColor),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
