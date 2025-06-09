import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:yapp/generated/assets.dart';
import 'package:yapp/src/features/auth/screen.dart';
import 'package:yapp/src/features/dashboard/screen.dart';
import 'package:yapp/src/features/splash/bloc/bloc.dart';
import 'package:yapp/src/features/splash/bloc/state.dart';
import 'package:yapp/src/shared/model/screen.dart';

import 'screen_wrapper.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SplashScreenWrapper(
      child: Scaffold(
        body: BlocConsumer<SplashScreenBloc, SplashScreenState>(
          listener: (context, state) {
            switch (state.nextScreen) {
              case Screen.auth:
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => AuthScreen()),
                );
                break;
              case Screen.dashboard:
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => DashboardScreen()),
                );
                break;
              default:
            }
          },
          builder: (context, state) => SafeArea(
            child: Center(child: Lottie.asset(Assets.animationsLogo)),
          ),
        ),
      ),
    );
  }
}
