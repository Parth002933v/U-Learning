import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/utils/image_utils.dart';
import 'package:ulearning/main.dart';

Widget AppImage({
  String image = ImageUtils.defaultImg,
  double height = 20,
  double width = double.infinity,
  bool isIcon = false,
}) {
  final ImageProvider myImage = AssetImage(image);

  return Image(
    image: myImage,
    fit: BoxFit.fitWidth,
    height: isIcon ? 30.h : height,
    width: isIcon ? 20.w : width,
  );
}

Widget AppIconImage({
  String image = ImageUtils.defaultImg,
  double width = 20,
  double height = 20,
}) {
  final ImageProvider myImage = AssetImage(image);
  return Image.asset(
    image,
    fit: BoxFit.fill,
    height: height.h,
    width: width.w,
  );
}
