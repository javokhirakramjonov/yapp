import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yapp/src/features/auth/domain/auth_repository.dart';

import 'event.dart';
import 'state.dart';

class AuthScreenBloc extends Bloc<AuthScreenEvent, AuthScreenState> {
  final AuthRepository _authRepository;

  AuthScreenBloc(this._authRepository) : super(AuthScreenState()) {
    on<LoginWithGoogle>(_onLoginWithGoogle);
  }

  Future<void> _onLoginWithGoogle(
    LoginWithGoogle event,
    Emitter<AuthScreenState> emit,
  ) async {
    final result = await _authRepository.signInWithGoogle();

    emit(state.copyWith(isAuthenticated: result));
  }
}
