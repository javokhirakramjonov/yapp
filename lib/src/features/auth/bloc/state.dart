class AuthScreenState {
  final bool isAuthenticated;

  const AuthScreenState({this.isAuthenticated = false});

  AuthScreenState copyWith({bool? isAuthenticated}) {
    return AuthScreenState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    );
  }
}
