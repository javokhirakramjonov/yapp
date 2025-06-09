import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yapp/src/features/auth/bloc/bloc.dart';
import 'package:yapp/src/features/auth/bloc/event.dart';
import 'package:yapp/src/features/auth/bloc/state.dart';
import 'package:yapp/src/features/dashboard/screen.dart';

import 'screen_wrapper.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScreenWrapper(
      child: Scaffold(
        body: SafeArea(
          child: BlocConsumer<AuthScreenBloc, AuthScreenState>(
            listener: (context, state) {
              if (state.isAuthenticated) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => DashboardScreen()),
                );
              }
            },
            builder: (context, state) => Center(
              child: ElevatedButton(
                onPressed: () {
                  context.read<AuthScreenBloc>().add(LoginWithGoogle());
                },
                child: Text("Login with Google"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
