import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning/common/text_widgets.dart';
import 'package:ulearning/common/utils/image_names.dart';
import 'package:ulearning/common/widgets.dart';
import 'package:ulearning/main.dart';
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
    super.initState();

    _controller = SignInController(ref: ref);
  }



  @override
  Widget build(BuildContext context) {
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
            // space form the top of thirdPartyLogin
            SizedBox(height: h * 0.04),

            // 3rd party logins
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // space from left side
                SizedBox(width: w * 0.06),

                // google logo
                thirdPartyLogin(logo: LogoImage.google, tooltip: "Google"),
                thirdPartyLogin(logo: LogoImage.apple, tooltip: "Apple"),
                thirdPartyLogin(
                  logo: LogoImage.facebook,
                  fullLogo: true,
                  tooltip: "Facebook",
                ),

                // space from right side
                SizedBox(width: w * 0.06),

              ],
            ),

            // space form 3rd party icons
            SizedBox(height: h * 0.02),

            // text of main login which is center
            Center(
              child: text14Normal(text: "Or use your email account to login"),
            ),

            SizedBox(height: h * 0.1),
            // email text field
            appTextField(
              onchange: (value) =>
                  ref.read(SignInProvider.notifier).onEmailChange(value),
              text: "Email",
              hintText: "Enter Your Email Address",
              iconName: IconImage.user,
            ),

            // password text field
            appTextField(
              onchange: (value) =>
                  ref.read(SignInProvider.notifier).onPasswordChange(value),
              text: "Password",
              hintText: "Enter Password",
              iconName: IconImage.password2,
              surfixIconName: IconImage.hidePassword,
              surfixIcon: true,
              hidePassword: true,
            ),

            // Forgot passowrd
            Padding(
              padding: EdgeInsets.only(
                left: w * 0.07,
                right: w * 0.07,
                bottom: h * 0.02,
              ),
              child: textUnderline(text: "Forgot Passowd"),
            ),

            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: h * 0.05),
              child: Column(
                children: [
                  AppButton(
                    onTap: () => _controller.handleSignIn(),
                    buttonName: "Sign in",
                  ),
                  SizedBox(height: h * 0.03),
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
