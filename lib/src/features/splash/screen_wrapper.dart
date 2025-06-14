import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:yapp/src/features/splash/bloc/event.dart';

import 'bloc/bloc.dart';

class SplashScreenWrapper extends StatelessWidget {
  final Widget child;

  const SplashScreenWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashScreenBloc(GetIt.I.get())..add(Started()),
      child: child,
    );
  }
}
