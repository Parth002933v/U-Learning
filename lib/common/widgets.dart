import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/app_colors.dart';
import 'package:ulearning/common/app_image.dart';
import 'package:ulearning/common/text_widgets.dart';
import 'package:ulearning/common/utils/image_names.dart';
import 'package:ulearning/main.dart';

// AppBar
AppBar buildAppBar({
  String tital = "Appbar",
}) {
  return AppBar(
    title: text20Normal(text: tital),
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
  final String hintText = "Hint Text",
  final String iconName = IconImage.user,
  final bool surfixIcon = false,
  final String surfixIconName = IconImage.showPassword,
  final bool hidePassword = false,
  required void Function(String value) onchange,
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
                margin: EdgeInsets.only(left: w * 0.04, right: w * 0.02),
                child: AppImage(
                  //  context: context!,
                  isIcon: true,
                  image: iconName,
                ),
              ),

              // TextFormField
              SizedBox(
                width: w * 0.6,
                child: TextFormField(
                  onChanged: (value) => onchange(value),
                  maxLines: 1,
                  autocorrect: false,
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

              // surfix Icon
              Offstage(
                offstage: !surfixIcon,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.visibility_off, color: Colors.black),
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
}

///----------------------------------------------------------
// button
class AppButton extends StatelessWidget {
  const AppButton(
      {super.key,
      this.index,
      this.pagecontroller,
      this.buttonName = "Button Name",
      this.onTap,
      this.isLogin = true});
  final int? index;
  final PageController? pagecontroller;
  final String buttonName;
  final bool isLogin;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: isLogin
                ? AppColors.primaryElement.withOpacity(0.8)
                : Colors.grey.shade200,
            blurRadius: 5,
            spreadRadius: 1,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      width: w * 0.9,
      height: h * 0.06,
      // width: 0.9.w,
      // height: 0.06.h,

      child: ElevatedButton(
        onPressed: () {
          // if index is given
          if (index != null) {
            // go to next page
            if (index! < 3) {
              // pagecontroller!.jumpToPage(index!);
              pagecontroller!.animateToPage(index!,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.linear);
            }

            // navigate to sign in page
            else {
              Navigator.of(context).pushNamed("/signIn");
            }

            // if index is not given and void Function is given
          } else if (index == null && onTap != null) {
            // pass the onTap Function
            onTap!();
          }
        },

        // style
        style: ButtonStyle(
          // text sizeS
          textStyle: const MaterialStatePropertyAll(TextStyle(fontSize: 17)),

          // shape give Border
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              side: BorderSide(
                width: isLogin ? 0 : 1,
                color: AppColors.primaryThreeElementText,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
          ),

          // SbackgroundColor
          backgroundColor: MaterialStatePropertyAll(
            isLogin ? AppColors.primaryElement : Colors.white,
          ),

          // Text Color
          foregroundColor:
              MaterialStatePropertyAll(isLogin ? Colors.white : Colors.black),
        ),
        child: index == 3 ? const Text('Get Started') : Text(buttonName),
      ),
    );
  }
}
