import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/provider/global_loder.dart';
import 'package:ulearning/common/routes/route_name_constants.dart';
import 'package:ulearning/common/widgets/text_widgets.dart';
import 'package:ulearning/common/utils/image_utils.dart';
import 'package:ulearning/common/widgets/app_button.dart';
import 'package:ulearning/common/widgets/app_textfield.dart';
import 'package:ulearning/common/widgets/build_app_bar.dart';
import 'package:ulearning/features/sign_in/provider/sign_in_notifire.dart';
import 'package:ulearning/features/sign_in/controller/sign_in_controller.dart';
import 'package:ulearning/features/sign_in/view/widget/sign_in_widgets.dart';
import 'package:ulearning/main.dart';

class SignIn extends ConsumerStatefulWidget {
  const SignIn({super.key});

  @override
  ConsumerState<SignIn> createState() => _SignInState();
}

class _SignInState extends ConsumerState<SignIn> {
  late SignInController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = SignInController(ref: ref);
  }

  @override
  Widget build(BuildContext context) {
    final signInN = ref.read(signInProvider.notifier);
    final globalLoaderP = ref.watch(globalLoaderProvider);
    return Scaffold(
      // white backgroundColor
      // backgroundColor: Colors.white,

      // custom appbar
      appBar: buildAppBar(tital: "Login"),

      // body
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 40.h),

            /// 3rd party logins
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 60.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // google logo
                  thirdPartyLogin(
                      logo: LogoImageConstant.google, tooltip: "Google"),
                  thirdPartyLogin(
                      logo: LogoImageConstant.apple, tooltip: "Apple"),
                  thirdPartyLogin(
                    logo: LogoImageConstant.facebook,
                    fullLogo: true,
                    tooltip: "Facebook",
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),

            const Center(
              child: Text14Normal(text: "Or use your email account to login"),
            ),

            SizedBox(height: 80.h),

            /// email
            appTextField(
              onchange: (value) => signInN.onEmailChange(value),
              onTopFieldText: "Email",
              keybordType: TextInputType.emailAddress,
              hintText: "Enter Your Email Address",
              iconName: IconImageConstant.user,
            ),

            /// password
            appTextField(
              onchange: (value) => signInN.onPasswordChange(value),
              onTopFieldText: "Password",
              hintText: "Enter Password",
              iconName: IconImageConstant.password2,
              surfixIconName: IconImageConstant.hidePassword,
              surfixIcon: true,
              hidePassword: true,
            ),

            /// Forgot passowrd
            Padding(
              padding: EdgeInsets.only(
                left: 30.w,
              ),
              child: textUnderline(text: "Forgot Password"),
            ),

            /// signIn & signUp
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 40.h),
              child: Column(
                children: [
                  AppButton(
                    onTap: () => _controller.handleSignIn(),
                    buttonName: "Sign in",
                    isLoading: globalLoaderP,
                  ),
                  SizedBox(height: 30.h),
                  AppButton(
                    onTap: () {
                      // navigate to signup page
                      Navigator.of(context)
                          .pushNamed(AppRouteConstants.SIGN_UP);
                    },
                    isLogin: false,
                    buttonName: "Sign up",
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
