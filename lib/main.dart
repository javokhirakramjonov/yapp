import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yapp/src/core/di/injections.dart';
import 'package:yapp/src/features/app/screen.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await setupDependencies();

  await GoogleFonts.pendingFonts([
    GoogleFonts.roboto(),
    GoogleFonts.robotoTextTheme(),
  ]);

  runApp(const AppScreen());
}
