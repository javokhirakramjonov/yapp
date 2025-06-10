import 'package:yapp/src/shared/model/user.dart';

class ContactsScreenState {
  final List<User> contacts;

  ContactsScreenState({this.contacts = const []});

  ContactsScreenState copyWith({List<User>? contacts}) {
    return ContactsScreenState(contacts: contacts ?? this.contacts);
  }
}
