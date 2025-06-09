import 'package:flutter/material.dart';

import 'screen_wrapper.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChatsScreenWrapper(
      child: Scaffold(
        body: SafeArea(child: Center(child: Text('Chats'))),
      ),
    );
  }
}
