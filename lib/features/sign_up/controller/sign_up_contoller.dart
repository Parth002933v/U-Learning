import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning/common/provider/global_loder.dart';
import 'package:ulearning/common/utils/tost_mesage.dart';
import 'package:ulearning/features/sign_up/provider/register_notifire.dart';

class SignUpController {
  late WidgetRef ref;

  SignUpController({required this.ref});

  void handleSignUp() async {
    final state = ref.read(registerProvider);

    String name = state.username;
    String email = state.email;
    String password = state.password;
    String rePassword = state.confirmPassword;

    // check the conditions
    if (name.isEmpty &&
        email.isEmpty &&
        password.isEmpty &&
        rePassword.isEmpty) {
      toastInfo("Please fill all the fields");
    } else if (name.isEmpty || state.username.isEmpty) {
      toastInfo("User name Is empty");
    } else if (email.isEmpty || state.email.isEmpty) {
      toastInfo("User email Is empty");
    } else if (password.isEmpty || state.password.isEmpty) {
      toastInfo("Please create a password");
    } else if (rePassword.isEmpty || state.confirmPassword.isEmpty) {
      toastInfo("Please Add confirm Password");
    } else if (state.password != state.confirmPassword) {
      toastInfo("Password did not match");
    }

    ref.read(globalLoaderProvider.notifier).setLoderValue(true);

    /// if all the conditions are full fields
    try {
      final navigate = Navigator.of(ref.context);

      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if (credential.user != null) {
        await credential.user?.sendEmailVerification().then(
              (value) => toastInfo(
                  "The Email has been send to verify your accounnt. Please open that email"),
            );
        credential.user?.updateDisplayName(name);
        navigate.pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastInfo('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        toastInfo('The account already exists for that email.');
      }
    } catch (e) {
      toastInfo(e.toString());
    }

    ref.read(globalLoaderProvider.notifier).setLoderValue(false);
  }
}
