import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning/common/text_widgets.dart';
import 'package:ulearning/common/utils/image_names.dart';
import 'package:ulearning/common/widgets.dart';
import 'package:ulearning/main.dart';
import 'package:ulearning/pages/sign_up/notifire/register_notifire.dart';
import 'package:ulearning/pages/sign_up/sign_up_contoller.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({super.key});

  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  late SignUpController _controller;

  // this will initialize the instance of the controller
  @override
  void initState() {
    super.initState();

    // assign the referebce value in object
    _controller = SignUpController(ref: ref);
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(registerProvider);
    return Scaffold(
      appBar: buildAppBar(tital: "SignUp"),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: h * 0.03),

            
            Center(
              child:
                  text14Normal(text: "Enter your details below & free sign up"),
            ),

            SizedBox(height: h * 0.06),

            // User name text field
            appTextField(
              onchange: (value) =>
                  ref.read(registerProvider.notifier).onUserNameChange(value),
              text: "User name",
              hintText: "Enter Your User Name",
              iconName: IconImage.user,
            ),

            // email text field
            appTextField(
              text: "Email",
              hintText: "Enter Your Email Address",
              iconName: IconImage.email,
              onchange: (value) =>
                  ref.read(registerProvider.notifier).onEmailChange(value),
            ),

            // password text field
            appTextField(
              onchange: (value) =>
                  ref.read(registerProvider.notifier).onPasswordChange(value),
              text: "Password",
              hintText: "Enter Password",
              iconName: IconImage.password2,
              surfixIconName: IconImage.hidePassword,
              surfixIcon: true,
              hidePassword: true,
            ),

            // Confirm password text field
            appTextField(
              onchange: (value) => ref
                  .read(registerProvider.notifier)
                  .onConfirmPasswordChange(value),

              text: "Confirm Password",
              hintText: "Re-Enter Password",

              iconName: IconImage.password2,
              //surfixIconName: IconImage.hidePassword,
              // surfixIcon: true,
              hidePassword: true,
            ),

            // Terms & Condition
            Container(
              margin: EdgeInsets.only(left: w * 0.05, right: w * 0.03),
              child: Row(
                children: [
                  // chech box
                  Checkbox(
                    value: false,
                    onChanged: (value) {},
                  ),

                  //text
                  Flexible(
                    child: text14Normal(
                        textAlign: TextAlign.start,
                        text:
                            "By Creating an account you have to agree with our term & condition"),
                  ),
                ],
              ),
            ),

            // Register Button
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: h * 0.1, bottom: h * 0.03),
              child: AppButton(
                onTap: () => _controller.handleSignUp(),
                buttonName: "Register",
              ),
            )
          ],
        ),
      ),
    );
  }
}
