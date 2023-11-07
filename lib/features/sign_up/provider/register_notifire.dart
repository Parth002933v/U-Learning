import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning/features/sign_up/provider/register_state.dart';
// part 'register_notifire.g.dart';

class RegisterNotifier extends StateNotifier<RegisterState> {
  RegisterNotifier() : super(RegisterState());

  void onUserNameChange(String name) {
    state = state.copyWith(username: name);
  }

  void onEmailChange(String email) {
    state = state.copyWith(email: email);
  }

  void onPasswordChange(String password) {
    state = state.copyWith(password: password);
  }

  void onConfirmPasswordChange(String confirmPassword) {
    state = state.copyWith(confirmPassword: confirmPassword);
  }
}

///---------------Provider------------------------------------------------------
final registerProvider =
    StateNotifierProvider<RegisterNotifier, RegisterState>((ref) {
  return RegisterNotifier();
});

