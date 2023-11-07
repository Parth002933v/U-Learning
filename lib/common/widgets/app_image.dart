import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/utils/image_utils.dart';
import 'package:ulearning/main.dart';



class AppImage extends StatelessWidget {
  const AppImage({
    super.key,
    this.image = LogoImageConstant.google,
    this.height = 20,
    this.width = double.infinity,
    this.isIcon = false,
  });
  final String image;
  final double height;
  final double width;
  final bool isIcon;

  @override
  Widget build(BuildContext context) {
    final ImageProvider myImage = AssetImage(image);

    return Image(
      image: myImage,
      fit: BoxFit.fitWidth,
      height: isIcon ? 30.h : height,
      width: isIcon ? 20.w : width,
    );
  }
}

class AppIconImage extends StatelessWidget {
  const AppIconImage({
    super.key,
    this.image = LogoImageConstant.google,
  });
  final String image;

  @override
  Widget build(BuildContext context) {
    final ImageProvider myImage = AssetImage(image);

    return Image(
      image: myImage,
      fit: BoxFit.fitWidth,
      height: 30.h,
      width: 20.w,
    );
  }
}
