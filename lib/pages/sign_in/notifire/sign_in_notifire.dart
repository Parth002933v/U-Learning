import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning/pages/sign_in/notifire/sign_in_state.dart';

class SignInNotifier extends StateNotifier<SignInState> {
  SignInNotifier() : super(SignInState());

  void onEmailChange(String email) {
    state = state.copyWith(email: email);
  }

  void onPasswordChange(String password) {
    state = state.copyWith(password: password);
  }
}


///------------ Provider------------------------------------------------------
final SignInProvider =
    StateNotifierProvider<SignInNotifier, SignInState>((ref) {
  return SignInNotifier();
});
