import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yapp/src/core/styling/font.dart';
import 'package:yapp/src/features/chat/screen.dart';
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
                child: Text('Contacts', style: AppFont.style24w700),
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

    return RefreshIndicator(
      onRefresh: () async {
        context.read<ContactsScreenBloc>().add(LoadContacts());
      },
      child: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];

          final shouldShowFirstLetter =
              index == 0 ||
              contacts[index - 1].name[0].toLowerCase().compareTo(
                    contact.name[0].toLowerCase(),
                  ) !=
                  0;

          return InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ChatScreen(user: contact),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Row(
                spacing: 16,
                children: [
                  SizedBox(
                    width: 32,
                    height: 32,
                    child: shouldShowFirstLetter
                        ? Center(
                            child: Text(
                              contact.name[0].toUpperCase(),
                              style: AppFont.style16W700.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          )
                        : null,
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(contact.photoUrl),
                  ),
                  Expanded(child: Text(contact.name)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
