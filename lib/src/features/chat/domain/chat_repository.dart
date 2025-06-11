import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:yapp/src/features/chat/model/message.dart';

class ChatRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  ChatRepository(this._firestore, this._auth);

  Future<List<Message>> getMessages(String uid) async {
    final List<Message> messages = [];

    final currentUser = _auth.currentUser;
    if (currentUser == null) {
      debugPrint('No user is currently logged in.');
      return messages;
    }

    // fake it till you make it
    // TODO: remove this when real messages are implemented
    messages.add(
      Message(
        fromUid: currentUser.providerData.firstOrNull?.uid ?? "no user",
        toUid: uid,
        message: 'Hello, this is a test message 1.',
        timestamp: DateTime.now(),
      ),
    );
    messages.add(
      Message(
        toUid: currentUser.providerData.firstOrNull?.uid ?? "no user",
        fromUid: uid,
        message: 'Hello, this is a test message 2.',
        timestamp: DateTime.now(),
      ),
    );

    final chatId = currentUser.uid.compareTo(uid) < 0
        ? '${currentUser.uid}#$uid'
        : '$uid#${currentUser.uid}';

    await _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .get()
        .then(
          (snapshot) {
            for (var doc in snapshot.docs) {
              messages.add(Message.fromJson(doc.data()));
            }
          },
          onError: (error) {
            debugPrint('Error fetching messages: $error');
          },
        );

    messages.sort((msg1, msg2) => msg1.timestamp.compareTo(msg2.timestamp));

    return messages;
  }
}
