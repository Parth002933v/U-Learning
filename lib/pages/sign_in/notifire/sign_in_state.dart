class SignInState {
  final String email;
  final String password;

  // constructor
  SignInState({
    this.email = '',
    this.password = '',
  });

  // coplyWith methode
  SignInState copyWith({
    String? email,
    String? password,
  }) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
