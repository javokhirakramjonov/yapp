import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bloc.dart';

class ContactsScreenWrapper extends StatelessWidget {
  final Widget child;

  const ContactsScreenWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContactsScreenBloc(),
      child: child,
    );
  }
}
