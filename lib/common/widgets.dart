import 'dart:js';

import 'package:flutter/material.dart';
import 'package:ulearning/common/app_colors.dart';
import 'package:ulearning/common/app_image.dart';
import 'package:ulearning/common/text_widgets.dart';
import 'package:ulearning/common/utils/image_names.dart';
import 'package:ulearning/main.dart';

// AppBar
AppBar buildAppBar({
  String tital = "Appbar",
  required BuildContext context,
}) {
  return AppBar(
    title: text20Normal(text: "Login"),
    centerTitle: true,
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(h * 0.01),
      child: Container(
        //width: w * 0.9,
        height: 1,
        color: Colors.grey.shade200,
      ),
    ),
  );
}

//  AppTextField
Widget appTextField({
  final String text = "text",
  required TextEditingController controller,
  final String hintText = "Hint Text",
  final String iconName = IconImage.user,
  final bool surfixIcon = false,
  final String surfixIconName = IconImage.showPassword,
  final bool hidePassword = false,
}) {
  return Container(
    // padding give space to all the two wigets
    padding: EdgeInsets.only(left: w * 0.07, right: w * 0.07, bottom: h * 0.02),

    // Column for text and textfield
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // text and space form text // widget 1
        Container(
          margin: EdgeInsets.only(bottom: h * 0.005, left: w * 0.008),
          child: text14Normal(text: text),
        ),

        // TextFormField // widget 2
        Container(
          width: double.infinity,
          height: h * 0.07,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.primaryFourthElementText),
            borderRadius: BorderRadius.circular(15),
            //color: Colors.red
          ),

          // row
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // prefix Icon
              Container(
                width: surfixIcon ? 20 : null,
                //   height: h * 0.07,
                margin: EdgeInsets.only(left: w * 0.04, right: w * 0.02),
                child: cachedappImage(
                  context: context,
                  isIcon: true,
                  image: iconName,
                ),
              ),

              // TextFormField
              SizedBox(
                width: w * 0.6,
                child: TextFormField(
                  maxLines: 1,
                  autocorrect: false,
                  controller: controller,
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.center,
                  obscureText: hidePassword,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                      left: w * 0.01,
                      right: w * 0.01,
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

              Offstage(
                offstage: !surfixIcon,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.visibility_off, color: Colors.black),
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
}
