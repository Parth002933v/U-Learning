import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/app_colors.dart';
import 'package:ulearning/main.dart';

import '../../common/app_image.dart';

Widget thirdPartyLogin({
  String logo = "assets/googleLogo.png",
  bool fullLogo = false,
  String? tooltip,
}) {
  return Tooltip(
    message: tooltip,
    child: InkWell(
      customBorder: const CircleBorder(),
      onTap: () {},
      child: Container(
        // to give Container size // if the lofo is full then remove padding
        padding: fullLogo ? const EdgeInsets.all(0) : const EdgeInsets.all(9),

        // To give circle shadow
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade200),
          shape: BoxShape.circle,
        ),

        child: AppImage(
          image: logo,
          width: fullLogo ? 37.w : 27.w,
          height: 55.h,
        ),
      ),
    ),
  );
}

Widget textUnderline(
    {String text = "", Color color = AppColors.primarySecondaryElementText}) {
  return InkWell(
    onTap: () {},
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 14.spMin,
        decoration: TextDecoration.underline,
        decorationColor: AppColors.primaryText,
        fontWeight: FontWeight.normal,
        color: color,
      ),
    ),
  );
}
