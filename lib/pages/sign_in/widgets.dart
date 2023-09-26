import 'package:flutter/material.dart';
import 'package:ulearning/common/app_colors.dart';
import 'package:ulearning/main.dart';

import '../../common/app_image.dart';

Widget thirdPartyLogin({
  String logo = "assets/googleLogo.png",
  bool fullLogo = false,
  BuildContext? context,
}) {
  return InkWell(
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

      // image Logo // if the lofo is full then increase its Radius
      // child: appImage(image: logo, width: fullLogo ? 40 : 30, height: 50),

      child: cachedappImage(
        context: context!,
        image: logo,
        width: fullLogo ? w * 0.091 : w * 0.065,
        height: h * 0.06,
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
        fontSize: 14,
        decoration: TextDecoration.underline,
        decorationColor: AppColors.primaryText,
        fontWeight: FontWeight.normal,
        color: color,
      ),
    ),
  );
}
