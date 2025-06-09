import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yapp/src/shared/model/screen.dart';

import 'event.dart';
import 'state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  final FirebaseAuth _firebaseAuth;

  SplashScreenBloc(this._firebaseAuth) : super(SplashScreenState()) {
    on<Started>(_onStarted);
  }

  Future<void> _onStarted(
    Started event,
    Emitter<SplashScreenState> emit,
  ) async {
    await Future.delayed(const Duration(milliseconds: 2500));

    if (_firebaseAuth.currentUser != null) {
      emit(state.copyWith(nextScreen: Screen.dashboard));
    } else {
      emit(state.copyWith(nextScreen: Screen.auth));
    }
  }
}
