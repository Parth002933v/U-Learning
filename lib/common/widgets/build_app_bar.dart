// AppBar
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/text_widgets.dart';

AppBar buildAppBar({
  String tital = "Appbar",
}) {
  return AppBar(
    title: text20Normal(text: tital),
    centerTitle: true,
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(9.h),
      child: Container(
        height: 1.1.h,
        color: Colors.grey.shade200,
      ),
    ),
  );
}
