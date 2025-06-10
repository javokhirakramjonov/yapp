import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yapp/src/core/styling/font.dart';
import 'package:yapp/src/features/contacts/bloc/bloc.dart';
import 'package:yapp/src/features/contacts/bloc/state.dart';
import 'package:yapp/src/shared/model/user.dart';

import 'bloc/event.dart';
import 'screen_wrapper.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ContactsScreenWrapper(
      child: BlocBuilder<ContactsScreenBloc, ContactsScreenState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 16,
                ),
                child: Text('Contacts', style: AppFont.headlineSmall),
              ),
              Expanded(child: _buildContacts(context, state.contacts)),
            ],
          );
        },
      ),
    );
  }

  Widget _buildContacts(BuildContext context, List<User> contacts) {
    if (contacts.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('No contacts found'),
            ElevatedButton(
              onPressed: () {
                context.read<ContactsScreenBloc>().add(LoadContacts());
              },
              child: Text("Reload"),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: contacts.length,
      itemBuilder: (context, index) {
        final contact = contacts[index];

        return ListTile(
          onTap: () {},
          title: Text(contact.name),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(contact.photoUrl),
          ),
        );
      },
    );
  }
}
