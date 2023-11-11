import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/provider/global_loder.dart';
import 'package:ulearning/common/widgets/text_widgets.dart';
import 'package:ulearning/common/utils/image_utils.dart';
import 'package:ulearning/common/widgets/app_button.dart';
import 'package:ulearning/common/widgets/app_textfield.dart';
import 'package:ulearning/common/widgets/build_app_bar.dart';
import 'package:ulearning/features/sign_up/controller/sign_up_contoller.dart';
import 'package:ulearning/features/sign_up/provider/register_notifire.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({super.key});

  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  late final SignUpController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = SignUpController(ref: ref);
  }

  @override
  Widget build(BuildContext context) {
    print('register page');
    final registerN = ref.read(registerProvider.notifier);
    // ref.watch(registerProvider);
    final bool globalLoaderP = ref.watch(globalLoaderProvider);
    return Scaffold(
      appBar: buildAppBar(tital: "SignUp"),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30.h),

            Center(
              child:
                  Text14Normal(text: "Enter your details below & free sign up"),
            ),

            SizedBox(height: 40.h),

            /// User name text field
            appTextField(
              onchange: (value) => registerN.onUserNameChange(value),
              onTopFieldText: "User name",
              hintText: "Enter Your User Name",
              iconName: IconImageConstant.user,
            ),

            /// email text field
            appTextField(
              onTopFieldText: "Email",
              keybordType: TextInputType.emailAddress,
              hintText: "Enter Your Email Address",
              iconName: IconImageConstant.email,
              onchange: (value) => registerN.onEmailChange(value),
            ),

            /// password text field
            appTextField(
              onchange: (value) => registerN.onPasswordChange(value),
              onTopFieldText: "Password",
              hintText: "Enter Password",
              iconName: IconImageConstant.password2,
              surfixIconName: IconImageConstant.hidePassword,
              surfixIcon: true,
              hidePassword: true,
            ),

            /// Confirm password text field
            appTextField(
              onchange: (value) => registerN.onConfirmPasswordChange(value),
              onTopFieldText: "Confirm Password",
              hintText: "Re-Enter Password",
              iconName: IconImageConstant.password2,
              hidePassword: true,
            ),

            /// Terms & Condition
            Container(
              // margin: EdgeInsets.only(left: w * 0.05, right: w * 0.03),
              margin: EdgeInsets.only(left: 25.w, right: 30.w),

              child: Row(
                children: [
                  // chech box
                  Checkbox(
                    value: false,
                    onChanged: (value) {},
                  ),

                  //text
                  Flexible(
                    child: Text14Normal(
                        textAlign: TextAlign.start,
                        text:
                            "By Creating an account you have to agree with our term & condition"),
                  ),
                ],
              ),
            ),

            /// Register Button
            Container(
              alignment: Alignment.center,
              // margin: EdgeInsets.only(top: h * 0.1, bottom: h * 0.03),
              margin: EdgeInsets.only(top: 30.h, bottom: 20.h),

              child: AppButton(
                onTap: () =>  _controller.handleSignUp(),
                buttonName: "Register",
                isLoading: globalLoaderP,
              ),
            )
          ],
        ),
      ),
    );
  }
}
