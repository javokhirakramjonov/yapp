import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:yapp/src/features/chat/bloc/event.dart';

import 'bloc/bloc.dart';

class ChatScreenWrapper extends StatelessWidget {
  final String uid;
  final Widget child;

  const ChatScreenWrapper({super.key, required this.child, required this.uid});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ChatScreenBloc(GetIt.I.get(), GetIt.I.get())..add(LoadChat(uid)),
      child: child,
    );
  }
}
