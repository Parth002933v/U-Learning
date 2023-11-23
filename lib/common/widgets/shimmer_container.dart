import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/style/box_decoration.dart';

Container ShimmerContainer({double height = 30, double width = 200}) {
  return Container(
    // color: Colors.white,
    height: height.h,
    width: width.w,
    decoration: buildBoxDecoration(),
  );
}
