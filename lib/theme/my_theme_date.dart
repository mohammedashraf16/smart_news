import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeDate {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      color: Colors.transparent,
      iconTheme: IconThemeData(
        color: Colors.white,
        size: 30,
      )
    ),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.exo(
        fontSize: 28,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: GoogleFonts.exo(
        fontSize: 22,
        fontWeight: FontWeight.w600,
      ),
      bodySmall: GoogleFonts.exo(
        fontSize: 15,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
