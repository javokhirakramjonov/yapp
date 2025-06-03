import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yapp/src/features/app/screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GoogleFonts.pendingFonts([
    GoogleFonts.roboto(),
    GoogleFonts.robotoTextTheme(),
  ]);

  runApp(const AppScreen());
}
