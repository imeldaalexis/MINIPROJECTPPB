import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Brand colors - warm catering vibe
  static const Color primary = Color(0xFFD45B2B);      // warm terracotta
  static const Color primaryDark = Color(0xFFB04422);
  static const Color secondary = Color(0xFFF5A623);    // golden amber
  static const Color surface = Color(0xFFFDF6EE);      // warm cream
  static const Color cardBg = Color(0xFFFFFFFF);
  static const Color textPrimary = Color(0xFF2C1A0E);
  static const Color textSecondary = Color(0xFF7A5C45);
  static const Color divider = Color(0xFFEADFD5);
  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFE53935);

  static const Map<String, Color> deliveryColors = {
    'siang 1': Color(0xFFFFF3E0),
    'siang 2': Color(0xFFE8F5E9),
    'malam 1': Color(0xFFE3F2FD),
    'malam 2': Color(0xFFF3E5F5),
  };

  static const Map<String, Color> deliveryTextColors = {
    'siang 1': Color(0xFFE65100),
    'siang 2': Color(0xFF2E7D32),
    'malam 1': Color(0xFF1565C0),
    'malam 2': Color(0xFF6A1B9A),
  };

  static ThemeData get theme => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: primary,
          primary: primary,
          secondary: secondary,
          surface: surface,
        ),
        scaffoldBackgroundColor: surface,
        textTheme: GoogleFonts.plusJakartaSansTextTheme().copyWith(
          displayLarge: GoogleFonts.plusJakartaSans(
              fontWeight: FontWeight.w700, color: textPrimary),
          titleLarge: GoogleFonts.plusJakartaSans(
              fontWeight: FontWeight.w700, color: textPrimary, fontSize: 18),
          titleMedium: GoogleFonts.plusJakartaSans(
              fontWeight: FontWeight.w600, color: textPrimary, fontSize: 16),
          bodyLarge: GoogleFonts.plusJakartaSans(color: textPrimary),
          bodyMedium: GoogleFonts.plusJakartaSans(color: textSecondary),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: primary,
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: false,
          titleTextStyle: GoogleFonts.plusJakartaSans(
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        cardTheme: CardThemeData(
          color: cardBg,
          elevation: 2,
          shadowColor: primary.withOpacity(0.15),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14)),
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primary,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)),
            padding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            textStyle: GoogleFonts.plusJakartaSans(
                fontWeight: FontWeight.w700, fontSize: 15),
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: cardBg,
          selectedItemColor: primary,
          unselectedItemColor: textSecondary,
          type: BottomNavigationBarType.fixed,
          elevation: 16,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: primary,
          foregroundColor: Colors.white,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: divider),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: divider),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: primary, width: 2),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
        chipTheme: ChipThemeData(
          backgroundColor: surface,
          selectedColor: primary,
          labelStyle: GoogleFonts.plusJakartaSans(fontSize: 13),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        dividerTheme: const DividerThemeData(color: divider, space: 1),
      );
}