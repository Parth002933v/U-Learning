import 'dart:js';

import 'package:flutter/material.dart';
import 'package:ulearning/common/app_colors.dart';
import 'package:ulearning/common/app_image.dart';
import 'package:ulearning/common/utils/imageUtils.dart';

import '../../common/text_widgets.dart';
import '../../main.dart';

Widget appOnBoardpage({
  String image = "assets/images/image1.png",
  String titalText = "",
  String subTital = "",
  required PageController Pagecontroller,
  int? index,
  BuildContext? context,
}) {
  return Column(
    children: [
      //Image
      SizedBox(
        height: h * 0.4,
        child: cachedappImage(image: image, context: context!),
      ),

      // SizedBox(
      //   height: h * 0.4,
      //   child: ImageUtils.precacheAssetImages(context, []),
      // ),
      //

      // Tital text
      Container(
        margin: const EdgeInsets.only(top: 15),
        child: text24Bold(text: titalText),
      ),

      // subtital Text
      Container(
        margin: const EdgeInsets.only(top: 15),
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: text16Normal(
          text: subTital,
          color: AppColors.primarySecondaryElementText,
        ),
      ),

      // text Butoon
      nextButton(index!, Pagecontroller, context)
    ],
  );
}

Widget nextButton(
    int index, PageController pagecontroller, BuildContext context) {
  return Container(
    width: w * 0.9,
    height: h * 0.06,
    margin: EdgeInsets.only(top: h * 0.3),
    child: ElevatedButton(
        onPressed: () {
          if (index < 3) {
            print(index);
            pagecontroller.animateToPage(index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.linear);
          } else {
            Navigator.of(context).pushNamed("/signIn");
          }
        },

        // style
        style: ButtonStyle(
          // text sizeS
          textStyle: const MaterialStatePropertyAll(TextStyle(fontSize: 17)),

          // shape give Border
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          ),

          // SbackgroundColor
          backgroundColor:
              const MaterialStatePropertyAll(AppColors.primaryElement),

          // Text Color
          foregroundColor: const MaterialStatePropertyAll(Colors.white),
        ),
        child: index == 3 ? const Text('Get Started') : const Text('Next')),
  );
}
