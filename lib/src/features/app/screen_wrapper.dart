import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bloc.dart';

class AppScreenWrapper extends StatelessWidget {
  final Widget child;

  const AppScreenWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => AppScreenBloc(), child: child);
  }
}
