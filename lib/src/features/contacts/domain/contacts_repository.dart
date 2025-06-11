import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter/foundation.dart';
import 'package:yapp/src/shared/model/user.dart';

class ContactsRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  ContactsRepository(this._firestore, this._auth);

  Future<List<User>> getContacts() async {
    final List<User> contacts = [];

    await _firestore
        .collection('users')
        .get()
        .then(
          (snapshot) {
            for (var doc in snapshot.docs) {
              final user = User.fromJson(doc.data());
              if (user.uid !=
                  _auth.currentUser?.providerData.firstOrNull?.uid) {
                contacts.add(user);
              }
            }
          },
          onError: (error) {
            debugPrint(error);
          },
        );

    return contacts;
  }
}
