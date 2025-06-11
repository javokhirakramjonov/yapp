import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yapp/src/features/contacts/domain/contacts_repository.dart';

import 'event.dart';
import 'state.dart';

class ContactsScreenBloc
    extends Bloc<ContactsScreenEvent, ContactsScreenState> {
  final ContactsRepository _contactsRepository;

  ContactsScreenBloc(this._contactsRepository) : super(ContactsScreenState()) {
    on<LoadContacts>(_onLoadContacts);
  }

  Future<void> _onLoadContacts(
    LoadContacts event,
    Emitter<ContactsScreenState> emit,
  ) async {
    final contacts = await _contactsRepository.getContacts();

    contacts.sort((user1, user2) {
      return user1.name.toLowerCase().compareTo(user2.name.toLowerCase());
    });

    emit(state.copyWith(contacts: contacts));
  }
}
