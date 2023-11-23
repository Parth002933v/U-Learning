import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning/common/model/user.dart';
import 'package:ulearning/common/provider/global_loder.dart';
import 'package:ulearning/common/routes/route_name_constants.dart';
import 'package:ulearning/common/utils/contants.dart';
import 'package:ulearning/common/utils/tost_mesage.dart';
import 'package:ulearning/features/sign_in/provider/sign_in_notifire.dart';
import 'package:ulearning/features/sign_in/repo/signin_repo.dart';
import 'package:ulearning/global.dart';
import 'package:ulearning/main.dart';

class SignInController {
  WidgetRef ref;

  SignInController({required this.ref});

  Future<void> handleSignIn() async {
    final state = ref.read(signInProvider);

    final String email = state.email;
    final String password = state.password;

    /// check the condition
    if (email.isEmpty && password.isEmpty) {
      toastInfo("Please fill all the fields");
    } else if (password.isEmpty || state.password.isEmpty) {
      toastInfo("Please enter the password");
    } else if (email.isEmpty) {
      toastInfo("Please enter your email");
    }

    ref.read(globalLoaderProvider.notifier).setLoderValue(true);

    final navigator = Navigator.of(ref.context);

    /// if all the conditions are correct
    try {
      final credential = await SignInRepo.firebaseSignIn(email, password);

      if (credential.user == null) {
        toastInfo("user not found please register user");
      }

      if (!credential.user!.emailVerified) {
        toastInfo("You must verify your email first");
        ref.read(globalLoaderProvider.notifier).setLoderValue(false);
        return;
      }

      var user = credential.user;
      //ex :(User(displayName: parth, email: ps542004@gmail.com, isEmailVerified: true, isAnonymous: false, metadata: UserMetadata(creationTime: 2023-11-02 15:05:19.202Z, lastSignInTime: 2023-11-02 15:09:44.712Z), phoneNumber: null, photoURL: null, providerData, [UserInfo(displayName: parth, email: ps542004@gmail.com, phoneNumber: null, photoURL: null, providerId: password, uid: ps542004@gmail.com)], refreshToken: null, tenantId: null, uid: 8STRxwE61fZnPsCsP0IHr0Rb2jv1))

      if (user != null) {
        print("login");

        String? displayName = user.displayName;
        String? email = user.email;
        String? id = user.uid;
        String? photoUrl = user.photoURL;

        LoginRequestEntity loginRequestEntity = LoginRequestEntity();
        loginRequestEntity.email = email;
        loginRequestEntity.avatar = photoUrl;
        loginRequestEntity.name = displayName;
        loginRequestEntity.open_id = id;
        loginRequestEntity.type = 1;

        asyncPostAllData(loginRequestEntity);
      }
    }
    // exceptions
    on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        toastInfo('No user found for that email');
      } else if (e.code == 'wrong-password') {
        toastInfo('Wrong password provided for that user.');
      } else if (e.code == "INVALID_LOGIN_CREDENTIALS") {
        toastInfo('invalid login credentials');
      } else if (e.code == 'invalid-email') {
        toastInfo('Please enter valid email');
      } else {
        toastInfo(e.toString());

        print(e);
      }
    } catch (e) {
      toastInfo(e.toString());
    }

    ref.read(globalLoaderProvider.notifier).setLoderValue(false);
  }

  Future<void> asyncPostAllData(LoginRequestEntity loginRequestEntity) async {
    final result = await SignInRepo.login(params: loginRequestEntity);

    if (result.code == 200) {
      print("the result code is : ${result.code}");
      try {
        await Global.storageServices.setString(
            AppConstants.STORAGE_USER_PROFILE_KEY, jsonEncode(result.data));

        await Global.storageServices.setString(
            AppConstants.STORAGE_USER_TOKEN_KEY, result.data!.access_token!);

        navkey.currentState?.pushNamedAndRemoveUntil(
            AppRouteConstants.APPLICATION, (route) => false);
      } catch (e) {
        toastInfo(e.toString());
      }
    } else {
      toastInfo("Login Error");
    }
  }
}
