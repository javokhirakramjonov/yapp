import 'package:flutter/material.dart';

import 'screen_wrapper.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ContactsScreenWrapper(
      child: Scaffold(
        body: SafeArea(child: Center(child: Text('Contacts'))),
      ),
    );
  }
}
