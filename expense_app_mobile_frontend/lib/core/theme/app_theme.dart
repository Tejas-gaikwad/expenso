import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTheme {
  AppTheme._();
  static ThemeData defaultTheme = ThemeData(
      useMaterial3: false,
      textTheme: GoogleFonts.openSansTextTheme(),
      scaffoldBackgroundColor: AppColors.white,
      iconTheme: IconThemeData(
        color: AppColors.textColor,
      ));
}
