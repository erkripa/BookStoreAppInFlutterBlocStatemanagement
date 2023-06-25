import 'dart:io';

import 'package:course_app/utils/app_colors.dart';
import 'package:course_app/utils/dm.dart';
import 'package:flutter/cupertino.dart';

class NxFileImage extends StatelessWidget {
  const NxFileImage({
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
        maxWidth: maxWidth ?? Dm.screenWidth,
        maxHeight: maxHeight ?? Dm.screenHeight,
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
