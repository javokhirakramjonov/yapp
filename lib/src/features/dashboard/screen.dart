import 'package:flutter/material.dart';

import 'screen_wrapper.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DashboardScreenWrapper(
      child: Scaffold(
        body: SafeArea(child: Center(child: Text("Dashboard"))),
      ),
    );
  }
}
