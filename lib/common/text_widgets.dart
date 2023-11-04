import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/app_colors.dart';

Widget text24Bold({String text = "First See Learning"}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 24.spMin,
      fontWeight: FontWeight.bold,
      color: AppColors.primaryText,
    ),
  );
}

Widget text20Normal(
    {String text = "", Color color = AppColors.primarySecondaryElementText}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: 20.spMin,
      fontWeight: FontWeight.normal,
      color: color,
    ),
  );
}

Widget text16Normal(
    {String text = "", Color color = AppColors.primarySecondaryElementText}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: 16.spMin,
      fontWeight: FontWeight.normal,
      color: color,
    ),
  );
}

Widget text14Normal({
  String text = "",
  Color color = AppColors.primarySecondaryElementText,
  TextAlign textAlign = TextAlign.center,
}) {
  return Text(
    text,
    textAlign: textAlign,
    style: TextStyle(
      fontSize: 14.spMin,
      fontWeight: FontWeight.normal,
      color: color,
    ),
  );
}
