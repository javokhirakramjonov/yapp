import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFont {
  static TextTheme get theme => GoogleFonts.robotoTextTheme();

  static TextStyle get displayLarge => theme.displayLarge!.copyWith(
    fontWeight: FontWeight.w700,
    fontSize: 57,
    height: 64 / 57,
  );

  static TextStyle get displayMedium => theme.displayMedium!.copyWith(
    fontWeight: FontWeight.w700,
    fontSize: 45,
    height: 52 / 45,
  );

  static TextStyle get displaySmall => theme.displaySmall!.copyWith(
    fontWeight: FontWeight.w700,
    fontSize: 36,
    height: 44 / 36,
  );

  static TextStyle get headlineLarge => theme.headlineLarge!.copyWith(
    fontWeight: FontWeight.w700,
    fontSize: 32,
    height: 40 / 32,
  );

  static TextStyle get headlineMedium => theme.headlineMedium!.copyWith(
    fontWeight: FontWeight.w700,
    fontSize: 28,
    height: 36 / 28,
  );

  static TextStyle get headlineSmall => theme.headlineSmall!.copyWith(
    fontWeight: FontWeight.w700,
    fontSize: 24,
    height: 32 / 24,
  );

  static TextStyle get labelLarge => theme.labelLarge!.copyWith(
    fontWeight: FontWeight.w500,
    fontSize: 18,
    height: 24 / 18,
  );

  static TextStyle get labelMedium => theme.labelMedium!.copyWith(
    fontWeight: FontWeight.w500,
    fontSize: 16,
    height: 24 / 16,
  );

  static TextStyle get labelSmall => theme.labelSmall!.copyWith(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    height: 20 / 14,
  );
}
