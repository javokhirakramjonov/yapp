import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository {
  final GoogleSignIn _googleSignIn;
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;

  AuthRepository(
    this._googleSignIn,
    this._firebaseAuth,
    this._firebaseFirestore,
  );

  Future<bool> signInWithGoogle() async {
    try {
      if (_googleSignIn.currentUser != null) {
        await _googleSignIn.signOut();
      }

      final user = await _googleSignIn.signIn();

      if (user == null) return false;

      final googleAuth = await user.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _firebaseAuth.signInWithCredential(credential);

      await saveUserToFirestore(user);

      return true;
    } catch (e) {
      debugPrint('Error signing in with Google: $e');
      return false;
    }
  }

  Future<void> saveUserToFirestore(GoogleSignInAccount user) async {
    final userData = {
      'uid': user.id,
      'displayName': user.displayName,
      'photoUrl': user.photoUrl,
    };

    await _firebaseFirestore
        .collection('users')
        .doc(user.id)
        .set(userData, SetOptions(merge: true));
  }
}
