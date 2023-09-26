import 'package:flutter/material.dart';
import 'package:ulearning/common/text_widgets.dart';
import 'package:ulearning/common/utils/image_names.dart';
import 'package:ulearning/common/widgets.dart';
import 'package:ulearning/main.dart';
import 'package:ulearning/pages/sign_in/widgets.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: h * 0.04),

          // 3rd party logins
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // space from left side
              SizedBox(width: w * 0.06),

              // google logo
              thirdPartyLogin(logo: LogoImage.google),
              thirdPartyLogin(logo: LogoImage.apple),
              thirdPartyLogin(logo: LogoImage.facebook, fullLogo: true),

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
            text: "Email",
            hintText: "Enter Your Email Address",
            controller: _emailController,
            iconName: IconImage.user,
          ),

          // password text field
          appTextField(
            text: "Password",
            hintText: "Enter Password",
            controller: _passwordController,
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
          )
        ],
      ),
    );
  }
}
