import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFont {
  static TextTheme get theme => GoogleFonts.robotoTextTheme();
  static TextStyle get _baseStyle => GoogleFonts.roboto();

  static TextStyle get style24w700 =>
      _baseStyle.copyWith(fontSize: 24, fontWeight: FontWeight.w700);

  static TextStyle get style16W700 =>
      _baseStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w700);

  static TextStyle get style16W500 =>
      _baseStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w500);

  static TextStyle get style12W400 =>
      _baseStyle.copyWith(fontSize: 12, fontWeight: FontWeight.w400);
}
