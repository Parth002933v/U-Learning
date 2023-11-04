import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/utils/image_utils.dart';
import 'package:ulearning/main.dart';

// Widget cachedappImage({
//   String image = LogoImage.google,
//   double height = 20,
//   double width = double.infinity,
//   bool isIcon = false,
//   required BuildContext context,
// }) {
//   // Preload the image
//   final i = precacheImage(AssetImage(image), context);
//   print("The prefetch image is $i");
//   return Image.asset(
//     image,
//     //alignment: Alignment.center,
//     fit: BoxFit.fitWidth,
//     // height: isIcon ? 15 : height,
//     // width: isIcon ? 15 : width,
//
//     height: isIcon ? h * 0.04 : height,
//     width: isIcon ? w * 0.04 : width,
//   );
// }

class AppImage extends StatelessWidget {
  const AppImage({
    super.key,
    this.image = LogoImage.google,
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

    // return Image(
    //   image: myImage,
    //   fit: BoxFit.fitWidth,
    //   height: isIcon ? h * 0.04 : height,
    //   width: isIcon ? w * 0.04 : width,
    // );
  }
}
