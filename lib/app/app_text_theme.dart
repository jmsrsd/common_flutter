import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextTheme {
  AppTextTheme._();

  static TextTheme Function([TextTheme]) get applyTo {
    return GoogleFonts.rubikTextTheme;
  }
}
