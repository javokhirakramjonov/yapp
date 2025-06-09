import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'event.dart';
import 'state.dart';

class AuthScreenBloc extends Bloc<AuthScreenEvent, AuthScreenState> {
  final GoogleSignIn _googleSignIn;
  final FirebaseAuth _firebaseAuth;

  AuthScreenBloc(this._googleSignIn, this._firebaseAuth)
    : super(AuthScreenState()) {
    on<LoginWithGoogle>(_onLoginWithGoogle);
  }

  Future<void> _onLoginWithGoogle(
    LoginWithGoogle event,
    Emitter<AuthScreenState> emit,
  ) async {
    try {
      if (_googleSignIn.currentUser != null) {
        await _googleSignIn.signOut();
      }

      final user = await _googleSignIn.signIn();

      if (user == null) {
        emit(state.copyWith(isAuthenticated: false));
        return;
      }

      final googleAuth = await user.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _firebaseAuth.signInWithCredential(credential);

      emit(state.copyWith(isAuthenticated: true));
    } catch (e) {
      debugPrint(e.toString());
      emit(state.copyWith(isAuthenticated: false));
    }
  }
}
