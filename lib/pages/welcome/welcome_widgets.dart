import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/app_colors.dart';
import 'package:ulearning/common/app_image.dart';
import 'package:ulearning/common/utils/image_utils.dart';
import 'package:ulearning/common/widgets/app_button.dart';

import '../../common/text_widgets.dart';
import '../../main.dart';

// welcome pages
Widget appOnBoardpage({
  String image = Images.image1,
  String titalText = "",
  String subTital = "",
  required PageController pagecontroller,
  required index,
}) {
  return Column(
    children: [
      //Image
      SizedBox(
        // height: 0.4 * h,
        height: 400.h,
        child: AppImage(image: image),
      ),

      // Tital text
      Container(
        // margin: EdgeInsets.only(top: h * 0.015),
        margin: EdgeInsets.only(top: 15.h),

        child: text24Bold(text: titalText),
      ),

      // subtital Text
      Container(
        // margin: EdgeInsets.only(top: h * 0.015),
        margin: EdgeInsets.only(top: 20.h),

        // padding: EdgeInsets.only(left: w * 0.1, right: w * 0.1),
        padding: EdgeInsets.only(left: 5.w, right: 5.w),

        child: text16Normal(
          text: subTital,
          color: AppColors.primarySecondaryElementText,
        ),
      ),

      // Next Button
      Padding(
        padding: EdgeInsets.only(top: 200.h),
        child: AppButton(
          buttonName: "Next",
          index: index,
          pagecontroller: pagecontroller,
        ),
      )
    ],
  );
}
