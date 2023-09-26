import 'package:flutter/material.dart';
import 'package:ulearning/common/utils/image_names.dart';
import 'package:ulearning/main.dart';

Widget cachedappImage({
  String image = LogoImage.google,
  double height = 20,
  double width = double.infinity,
  bool isIcon = false,
  required BuildContext context,
}) {
  // Preload the image
  precacheImage(AssetImage(image), context);

  return Image.asset(
    image,
    //alignment: Alignment.center,
    fit: BoxFit.fitWidth,
    // height: isIcon ? 15 : height,
    // width: isIcon ? 15 : width,

    height: isIcon ? h * 0.04 : height,
    width: isIcon ? w * 0.04 : width,
  );
}

// Widget cachedappImage({
//   String image = LogoImage.google,
//   double height = 20,
//   double width = double.infinity,
//   bool isIcon = false,
// }) {
//   return Image(
//
//       fit: BoxFit.fitWidth,
//       height: isIcon ? h * 0.04 : height,
//       width: isIcon ? w * 0.04 : width,
//       image: AssetImage(image));
// }
