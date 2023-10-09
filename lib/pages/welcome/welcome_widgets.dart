import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/app_colors.dart';
import 'package:ulearning/common/app_image.dart';
import 'package:ulearning/common/utils/image_names.dart';
import 'package:ulearning/common/widgets.dart';

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
        height: 0.4 * h,
        // height: 0.4.h,
        child: AppImage(image: image),
      ),

      // Tital text
      Container(
        margin: EdgeInsets.only(top: h *0.015),
        // margin: EdgeInsets.only(top: 0.015.h),

        child: text24Bold(text: titalText),
      ),

      // subtital Text
      Container(
        // margin: EdgeInsets.only(top: h * 0.015),
        margin: EdgeInsets.only(top: 0.015.h),

        // padding: EdgeInsets.only(left: w * 0.1, right: w * 0.1),
        padding: EdgeInsets.only(left: 0.1.w, right: 0.1.w),

        child: text16Normal(
          text: subTital,
          color: AppColors.primarySecondaryElementText,
        ),
      ),

      // Next Button
      Padding(
        padding: EdgeInsets.only(top: h * 0.3),
        // padding: EdgeInsets.only(top: 0.3.h),

        child: AppButton(
            buttonName: "Next", index: index, pagecontroller: pagecontroller),
      )
    ],
  );
}

// Widget nextButton(
//     {required int index,
//     required PageController pagecontroller,
//     required BuildContext context}) {
//   return Container(
//     width: w * 0.9,
//     height: h * 0.06,
//     margin: EdgeInsets.only(top: h * 0.3),
//     child: ElevatedButton(
//         onPressed: () {
//           if (index < 3) {
//             pagecontroller.animateToPage(index,
//                 duration: const Duration(milliseconds: 300),
//                 curve: Curves.linear);
//           } else {
//             //  Navigator.of(context).pushNamed("/signIn");
//             Navigator.of(context).push(MaterialPageRoute(
//               builder: (context) => SignIn(),
//             ));
//           }
//         },
//
//         // style
//         style: ButtonStyle(
//           // text sizeS
//           textStyle: const MaterialStatePropertyAll(TextStyle(fontSize: 17)),
//
//           // shape give Border
//           shape: MaterialStateProperty.all(
//             RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//           ),
//
//           // SbackgroundColor
//           backgroundColor:
//               const MaterialStatePropertyAll(AppColors.primaryElement),
//
//           // Text Color
//           foregroundColor: const MaterialStatePropertyAll(Colors.white),
//         ),
//         child: index == 3 ? const Text('Get Started') : const Text('Next')),
//   );
// }
