import 'package:cached_network_image/cached_network_image.dart';
import 'package:kahani_box/utils/app_colors.dart';
import 'package:kahani_box/utils/dimens.dart';
import 'package:kahani_box/widgets/common/custom_colored_box.dart';
import 'package:flutter/cupertino.dart';

class AyushNetworkImage extends StatelessWidget {
  const AyushNetworkImage({
    Key? key,
    required this.imageUrl,
    this.radius,
    this.width,
    this.height,
    this.maxWidth,
    this.maxHeight,
    this.imageFit,
  }) : super(key: key);

  final String imageUrl;
  final double? radius;
  final double? width;
  final double? height;
  final double? maxWidth;
  final double? maxHeight;
  final BoxFit? imageFit;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? Dimens.screenWidth,
      height: height,
      constraints: BoxConstraints(
        maxWidth: maxWidth ?? Dimens.screenWidth,
        maxHeight: maxHeight ?? Dimens.screenHeight,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius ?? 0.0),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: imageFit ?? BoxFit.cover,
          placeholder: (ctx, url) => AyushColoredBox(
            width: width,
            height: height,
          ),
          errorWidget: (ctx, url, err) => const Icon(
            CupertinoIcons.info,
            color: AppColors.errorColor,
          ),
        ),
      ),
    );
  }
}
