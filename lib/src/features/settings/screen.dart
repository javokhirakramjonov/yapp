import 'package:flutter/material.dart';

import 'screen_wrapper.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsScreenWrapper(
      child: Scaffold(
        body: SafeArea(child: Center(child: Text('Settings'))),
      ),
    );
  }
}
