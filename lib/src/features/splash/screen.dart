import 'package:flutter/material.dart';

import 'screen_wrapper.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SplashScreenWrapper(
      child: Scaffold(
        body: SafeArea(child: Center(child: Text("Hello Yapp"))),
      ),
    );
  }
}
