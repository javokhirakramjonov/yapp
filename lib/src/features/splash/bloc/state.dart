import 'package:yapp/src/shared/model/screen.dart';

class SplashScreenState {
  final Screen? nextScreen;

  const SplashScreenState({this.nextScreen});

  SplashScreenState copyWith({Screen? nextScreen}) {
    return SplashScreenState(nextScreen: nextScreen ?? this.nextScreen);
  }
}
