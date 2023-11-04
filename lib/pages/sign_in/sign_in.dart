import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/provider/global_loder.dart';
import 'package:ulearning/common/text_widgets.dart';
import 'package:ulearning/common/utils/image_utils.dart';
import 'package:ulearning/common/widgets/app_button.dart';
import 'package:ulearning/common/widgets/app_textfield.dart';
import 'package:ulearning/common/widgets/build_app_bar.dart';
import 'package:ulearning/pages/sign_in/notifire/sign_in_notifire.dart';
import 'package:ulearning/pages/sign_in/sign_in_controller.dart';
import 'package:ulearning/pages/sign_in/sign_in_widgets.dart';

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

    _controller = SignInController();
  }

  @override
  Widget build(BuildContext context) {
    final signInN = ref.read(SignInProvider.notifier);
    final globalLoaderP = ref.watch(globalLoaderProvider);
    ref.watch(SignInProvider);
    return Scaffold(
      // white backgroundColor
      backgroundColor: Colors.white,

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
                  thirdPartyLogin(logo: LogoImage.google, tooltip: "Google"),
                  thirdPartyLogin(logo: LogoImage.apple, tooltip: "Apple"),
                  thirdPartyLogin(
                    logo: LogoImage.facebook,
                    fullLogo: true,
                    tooltip: "Facebook",
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),

            Center(
              child: text14Normal(text: "Or use your email account to login"),
            ),

            SizedBox(height: 80.h),

            /// email
            appTextField(
              onchange: (value) => signInN.onEmailChange(value),
              text: "Email",
              keybordType: TextInputType.emailAddress,
              hintText: "Enter Your Email Address",
              iconName: IconImage.user,
            ),

            /// password
            appTextField(
              onchange: (value) => signInN.onPasswordChange(value),
              text: "Password",
              hintText: "Enter Password",
              iconName: IconImage.password2,
              surfixIconName: IconImage.hidePassword,
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
                    onTap: () => _controller.handleSignIn(ref: ref),
                    buttonName: "Sign in",
                    isLoading: globalLoaderP,
                  ),

                  // SizedBox(height: h * 0.03),
                  SizedBox(height: 30.h),

                  AppButton(
                    onTap: () {
                      // navigate to signup page
                      Navigator.of(context).pushNamed("/SignUp");
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
