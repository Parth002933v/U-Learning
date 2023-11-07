//  AppTextField
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/style/app_colors.dart';
import 'package:ulearning/common/widgets/app_image.dart';
import 'package:ulearning/common/widgets/text_widgets.dart';
import 'package:ulearning/common/utils/image_utils.dart';

Widget appTextField({
  final String text = "text",
  final String hintText = "Hint Text",
  final String iconName = IconImageConstant.user,
  final bool surfixIcon = false,
  final String surfixIconName = IconImageConstant.showPassword,
  bool hidePassword = false,
  required void Function(String value) onchange,
  TextInputType keybordType = TextInputType.text,
}) {
  return Container(
    // padding give space to all the two wigets
    padding: EdgeInsets.only(left: 30.w, right: 30.w, bottom: 20.h),

    // Column for text and textfield
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// text and space form text // widget 1
        Container(
          margin: EdgeInsets.only(bottom: 5.h, left: 5.w),
          child: text14Normal(text: text),
        ),

        ///textFormField
        Container(
          width: double.infinity,
          // height: h * 0.07,
          height: 65.h,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.primaryFourthElementText),
            borderRadius: BorderRadius.circular(15),
            //color: Colors.red
          ),

          // row
          child: StatefulBuilder(builder: (context, setState) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                /// prefix Icon
                Container(
                  width: surfixIcon ? 20.w : null,
                  // margin: EdgeInsets.only(left: w * 0.04, right: w * 0.02),
                  margin: EdgeInsets.only(left: 15.w, right: 10.w),
                  child: AppIconImage(
                    image: iconName,
                  ),
                ),

                /// TextFormField
                SizedBox(
                  width: surfixIcon ? 250.w : 300.w,
                  child: TextFormField(
                    onChanged: (value) => onchange(value),
                    maxLines: 1,
                    autocorrect: false,
                    textAlign: TextAlign.start,
                    textAlignVertical: TextAlignVertical.center,
                    obscureText: hidePassword,
                    keyboardType: keybordType,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                        left: 2.w,
                        right: 2.w,
                      ), // important
                      hintText: hintText,
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                    ),
                  ),
                ),

                /// surfix Icon
                Offstage(
                  offstage: !surfixIcon,
                  child: IconButton(
                    iconSize: 25.spMin,
                    onPressed: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                    icon: Icon(
                      hidePassword ? Icons.visibility_off : Icons.visibility,
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            );
          }),
        ),
      ],
    ),
  );
}
