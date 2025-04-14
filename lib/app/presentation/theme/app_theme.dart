import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get customLightTheme {
    return ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(
          0xFFF0BB78,
        ), 
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: const Color(0xFFF0F0F0), 
      appBarTheme: AppBarTheme(
        backgroundColor: const Color(
          0x00fff0dc,
        ), 
        elevation: 2,
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Color(0xFF131010), 
        ),
      ),
      textTheme: GoogleFonts.poppinsTextTheme(ThemeData.light().textTheme),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(
          0x00fff0dc,
        ), 
        selectedItemColor: Color(
          0xFFF0BB78,
        ),
        unselectedItemColor: Color(
          0xFF543A14,
        ), 
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
      cardTheme: CardTheme(
        color: const Color(0xFF543A14), 
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 5,
        margin: const EdgeInsets.all(8),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: const Color(
          0xFFF0F0F0,
        ), 
      ),
      iconTheme: const IconThemeData(
        color: Color(0xFF543A14), 
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xFFF0BB78), 
        foregroundColor: Colors.white, 
      ),
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: Color(
          0xFFF0F0F0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide.none,
        ),
        hintStyle: TextStyle(
          color: Color(0xFF543A14),
        ), 
        labelStyle: TextStyle(
          color: Color(0xFF131010),
        ), 
      ),
    );
  }
}
