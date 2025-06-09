import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<void> setupDependencies() async {
  GetIt.I.registerSingleton(GoogleSignIn());
  GetIt.I.registerSingleton(FirebaseAuth.instance);
}
