import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:yapp/generated/assets.dart';

import 'screen_wrapper.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SplashScreenWrapper(
      child: Scaffold(
        body: SafeArea(
          child: Center(child: Lottie.asset(Assets.animationsLogo)),
        ),
      ),
    );
  }
}
