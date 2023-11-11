// AppBar
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/style/app_colors.dart';
import 'package:ulearning/common/widgets/text_widgets.dart';

AppBar buildAppBar({
  String tital = "Appbar",
}) {
  return AppBar(
    title: text20Normal(text: tital),
    centerTitle: true,
    // backgroundColor: Colors.white,
    elevation: 0,
    foregroundColor: Colors.black,
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(9.h),
      child: Container(
        height: 1.1.h,
        color: Colors.grey.shade200,
      ),
    ),
  );
}
