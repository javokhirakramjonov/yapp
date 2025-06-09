import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'bloc/bloc.dart';

class AuthScreenWrapper extends StatelessWidget {
  final Widget child;

  const AuthScreenWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthScreenBloc(GetIt.I.get(), GetIt.I.get()),
      child: child,
    );
  }
}
