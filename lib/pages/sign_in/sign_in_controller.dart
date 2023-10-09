import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning/common/utils/tost_mesage.dart';
import 'package:ulearning/pages/sign_in/notifire/sign_in_notifire.dart';

class SignInController {
  final WidgetRef ref;

  SignInController({required this.ref});

  Future<void> handleSignIn() async {
    final state = ref.read(SignInProvider);

    String email = state.email;
    String password = state.password;

    log(email);
    log(password);

    // check the condition
    if (email.isEmpty && password.isEmpty) {
      toastInfo("Please fill all the fields");
    } else if (password.isEmpty || state.password.isEmpty) {
      toastInfo("Please enter the password");
    } else if (email.isEmpty) {
      toastInfo("Please enter your email");
    }

    // if all the conditions are full fields
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      // if user not verify his email during signup
      if (!credential.user!.emailVerified) {
        toastInfo("You must first verify your email");
      }

      var user = credential.user;
      if (user != null) {
        print("login");
      }
    }
    // exceptions
    on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        toastInfo('No user found for that email');
      } else if (e.code == 'wrong-password') {
        toastInfo('Wrong password provided for that user.');
      } else if (e.code == "INVALID_LOGIN_CREDENTIALS") {
        toastInfo('User Not Exist');
      } else {
        toastInfo(e.toString());
      }
    } catch (e) {
      toastInfo(e.toString());
    }
  }
}
