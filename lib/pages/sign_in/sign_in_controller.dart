import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning/common/entities/entitites.dart';
// import 'package:ulearning/common/entities/entitites.dart';
import 'package:ulearning/common/provider/global_loder.dart';
import 'package:ulearning/common/utils/contants.dart';
import 'package:ulearning/common/utils/tost_mesage.dart';
import 'package:ulearning/global.dart';
import 'package:ulearning/pages/sign_in/notifire/sign_in_notifire.dart';

class SignInController {
  Future<void> handleSignIn({required WidgetRef ref}) async {
    final state = ref.read(SignInProvider);

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
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      if (credential.user == null) {
        toastInfo("user not found please register user");
      }

      if (!credential.user!.emailVerified) {
        toastInfo("You must first verify your email");
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
      } else {
        toastInfo(e.toString());
      }
    } catch (e) {
      toastInfo(e.toString());
    }

    ref.read(globalLoaderProvider.notifier).setLoderValue(false);
  }

  void asyncPostAllData(LoginRequestEntity loginRequestEntity) {
    try {
      // Navigator.of(r)
      Global.storageServices
          .setString(AppContants.STORAGE_USER_PROFILE_KEY, 'value');
      Global.storageServices
          .setString(AppContants.STORAGE_USER_TOKEN_KEY, 'value');
    } catch (e) {
      print(e);
    }
  }
}
