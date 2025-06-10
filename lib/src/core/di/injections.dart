import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:yapp/src/features/auth/injections.dart';
import 'package:yapp/src/features/contacts/injections.dart';

Future<void> setupDependencies() async {
  GetIt.I.registerSingleton(GoogleSignIn());
  GetIt.I.registerSingleton(FirebaseAuth.instance);
  GetIt.I.registerSingleton(FirebaseFirestore.instance);

  setupAuthScreenDependencies();
  initContactsScreenDependencies();
}
