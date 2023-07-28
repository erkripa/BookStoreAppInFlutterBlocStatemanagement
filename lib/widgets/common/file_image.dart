import 'dart:io';

import 'package:kahani_box/utils/app_colors.dart';
import 'package:kahani_box/utils/dimens.dart';
import 'package:flutter/cupertino.dart';

class AyushFileImage extends StatelessWidget {
  const AyushFileImage({
    Key? key,
    required this.file,
    this.width,
    this.height,
    this.maxWidth,
    this.maxHeight,
    this.scale,
    this.fit,
  }) : super(key: key);

  final File file;
  final double? width;
  final double? height;
  final double? maxWidth;
  final double? maxHeight;
  final double? scale;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height,
      constraints: BoxConstraints(
        maxWidth: maxWidth ?? Dimens.screenWidth,
        maxHeight: maxHeight ?? Dimens.screenHeight,
      ),
      child: Image.file(
        file,
        fit: fit ?? BoxFit.cover,
        errorBuilder: (ctx, url, err) => const Icon(
          CupertinoIcons.info,
          color: AppColors.errorColor,
        ),
        width: width,
        height: height,
      ),
    );
  }
}
