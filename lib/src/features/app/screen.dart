import 'package:flutter/material.dart';
import 'package:yapp/src/features/splash/screen.dart';

import 'screen_wrapper.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScreenWrapper(
      child: MaterialApp(
        title: 'Yapp',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: SplashScreen(),
      ),
    );
  }
}
