import 'package:kahani_box/utils/app_colors.dart';
import 'package:kahani_box/utils/dimens.dart';
import 'package:flutter/cupertino.dart';

class AyushAssetImage extends StatelessWidget {
  const AyushAssetImage({
    Key? key,
    required this.imgAsset,
    this.width,
    this.height,
    this.maxWidth,
    this.maxHeight,
    this.scale,
    this.fit,
    this.isRadius = false,
  }) : super(key: key);

  final String imgAsset;
  final double? width;
  final double? height;
  final double? maxWidth;
  final double? maxHeight;
  final double? scale;
  final BoxFit? fit;
  final bool isRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height,
      constraints: BoxConstraints(
        maxWidth: maxWidth ?? Dimens.screenWidth,
        maxHeight: maxHeight ?? Dimens.screenHeight,
      ),
      child: ClipRRect(
        borderRadius:
            isRadius ? Dimens.circularBorderRadius : BorderRadius.zero,
        child: Image.asset(
          imgAsset,
          fit: fit ?? BoxFit.contain,
          errorBuilder: (ctx, url, err) => const Icon(
            CupertinoIcons.info,
            color: AppColors.errorColor,
          ),
          width: width,
          height: height,
          scale: scale ?? 1.0,
        ),
      ),
    );
  }
}
