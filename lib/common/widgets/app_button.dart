// button
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/style/app_colors.dart';
import 'package:ulearning/common/routes/route_name_constants.dart';
import 'package:ulearning/common/utils/contants.dart';
import 'package:ulearning/global.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.index,
    this.pagecontroller,
    this.buttonName = "Button Name",
    this.onTap,
    this.isLogin = true,
    this.isLoading = false,
  });
  final int? index;
  final PageController? pagecontroller;
  final String buttonName;
  final bool isLogin;
  final void Function()? onTap;
  final bool isLoading;
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
      width: 370.w,
      height: 55.h,
      child: ElevatedButton(
        onPressed: isLoading == false
            ? () {
                // if index is given
                if (index != null) {
                  // go to next page
                  if (index! < 3) {
                    // pagecontroller!.jumpToPage(index!);
                    pagecontroller!.animateToPage(index!,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.linear);
                  }

                  /// navigate to sign in page (onboard to sign in page)
                  else {
                    Global.storageServices.setBool(
                        AppConstants.STORAGE_DEVICE_FIRST_TIME_OPEN, true);

                    Navigator.of(context).pushNamedAndRemoveUntil(
                        AppRouteConstants.SIGN_IN, (route) => false);
                  }

                  // if index is not given and void Function is given
                } else if (index == null && onTap != null) {
                  // pass the onTap Function
                  onTap!();
                }
              }
            : null,

        // style
        style: ButtonStyle(
          /// text sizeS
          textStyle: MaterialStatePropertyAll(TextStyle(fontSize: 17.spMin)),

          /// shape give Border
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              side: BorderSide(
                width: isLogin ? 0 : 1,
                color: AppColors.primaryThirdElementText,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
          ),

          /// backgroundColor
          backgroundColor: MaterialStatePropertyAll(
            isLogin ? AppColors.primaryElement : Colors.white,
          ),

          /// Text Color
          foregroundColor:
              MaterialStatePropertyAll(isLogin ? Colors.white : Colors.black),
        ),
        child: index == 3
            ? const Text('Get Started')
            : isLoading == false
                ? Text(buttonName)
                : const CircularProgressIndicator(
                    color: Colors.white,
                  ),
      ),
    );
  }
}
