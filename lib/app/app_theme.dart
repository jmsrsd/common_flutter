import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_text_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get data {
    final theme = ThemeData.light();

    return theme.copyWith(
      textTheme: AppTextTheme.applyTo(theme.textTheme),
      primaryTextTheme: AppTextTheme.applyTo(theme.primaryTextTheme),
      accentTextTheme: AppTextTheme.applyTo(theme.accentTextTheme),
      splashColor: theme.accentColor.withOpacity(0.12),
      highlightColor: theme.accentColor.withOpacity(0.12),
      buttonTheme: theme.buttonTheme.copyWith(
        splashColor: theme.accentColor.withOpacity(0.12),
        highlightColor: theme.accentColor.withOpacity(0.12),
      ),
    );
  }
}
