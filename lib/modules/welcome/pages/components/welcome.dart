import 'package:course_app/assets/app_assets.dart';
import 'package:course_app/widgets/common/asset_image.dart';
import 'package:flutter/material.dart';

class Weclome extends StatelessWidget {
  const Weclome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: AyushAssetImage(
            imgAsset: Assets.welcome1,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
