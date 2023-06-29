import 'package:course_app/utils/app_colors.dart';
import 'package:course_app/utils/dimens.dart';
import 'package:flutter/material.dart';

class VerifiedWidget extends StatelessWidget {
  const VerifiedWidget({
    Key? key,
    required this.verifiedCategory,
    this.size,
  }) : super(key: key);

  final String verifiedCategory;
  final double? size;

  Color getIconColor(String category) {
    switch (category) {
      case 'verified':
        return AppColors.primaryColor;
      case 'unverified':
        return AppColors.primaryColor;
      case 'pending':
        return AppColors.primaryColor;
      case 'rejected':
        return AppColors.primaryColor;
      default:
        return AppColors.primaryColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.verified,
      color: getIconColor(verifiedCategory),
      size: size ?? Dimens.twenty,
    );
  }
}
