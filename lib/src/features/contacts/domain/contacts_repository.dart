import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:yapp/src/shared/model/user.dart';

class ContactsRepository {
  final FirebaseFirestore _firestore;

  ContactsRepository(this._firestore);

  Future<List<User>> getContacts() async {
    final List<User> contacts = [];

    await _firestore
        .collection('users')
        .get()
        .then(
          (snapshot) {
            for (var doc in snapshot.docs) {
              contacts.add(User.fromJson(doc.data()));
            }
          },
          onError: (error) {
            debugPrint(error);
          },
        );

    return contacts;
  }
}
