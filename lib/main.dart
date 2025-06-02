import 'package:flutter/material.dart';
import 'screens/faculty_list_screen.dart';

void main() {
  runApp(FacultyApp());
}

class FacultyApp extends StatelessWidget {
  const FacultyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Faculty Manager',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Primary brand color - deep red
        primaryColor: Color(0xFFA62C2C),

        // Background with subtle warm tone
        scaffoldBackgroundColor: Color(0xFFFFFBF7),

        // Color scheme for Material 3 compatibility
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Color(0xFFA62C2C),
          secondary: Color(0xFFE83F25),
          tertiary: Color(0xFFEA7300),
          surface: Color(0xFFFFFBF7),
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Color(0xFF2C2C2C),
        ),

        // AppBar with gradient-like effect using primary red
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFFA62C2C),
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),

        // FAB with bright orange accent
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Color(0xFFEA7300),
          foregroundColor: Colors.white,
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),

        // Elevated buttons with gradient-style colors
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFE83F25),
            foregroundColor: Colors.white,
            elevation: 3,
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            textStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.3,
            ),
          ),
        ),

        // Input fields with warm styling
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Color(0xFFD3CA79), width: 1.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Color(0xFFD3CA79), width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Color(0xFFA62C2C), width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Color(0xFFE83F25), width: 1.5),
          ),
          labelStyle: TextStyle(
            color: Color(0xFF666666),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          hintStyle: TextStyle(
            color: Color(0xFF999999),
            fontSize: 14,
          ),
        ),

        // Card theme for any cards in the app
        cardTheme: CardThemeData(
          color: Colors.white,
          elevation: 4,
          shadowColor: Color(0xFFA62C2C).withOpacity(0.1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),

        // Text button theme
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Color(0xFFA62C2C),
            textStyle: TextStyle(
              fontWeight: FontWeight.w500,
              letterSpacing: 0.3,
            ),
          ),
        ),

        // Icon theme
        iconTheme: IconThemeData(
          color: Color(0xFFA62C2C),
          size: 24,
        ),

        // List tile theme
        listTileTheme: ListTileThemeData(
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          tileColor: Colors.white,
        ),

        // Divider theme
        dividerTheme: DividerThemeData(
          color: Color(0xFFD3CA79).withOpacity(0.3),
          thickness: 1,
          space: 20,
        ),

        // Text theme with warm colors
        textTheme: TextTheme(
          headlineLarge: TextStyle(
            color: Color(0xFFA62C2C),
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
          headlineMedium: TextStyle(
            color: Color(0xFFA62C2C),
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
          titleLarge: TextStyle(
            color: Color(0xFF2C2C2C),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          titleMedium: TextStyle(
            color: Color(0xFF2C2C2C),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          bodyLarge: TextStyle(
            color: Color(0xFF2C2C2C),
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          bodyMedium: TextStyle(
            color: Color(0xFF555555),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      home: FacultyListScreen(),
    );
  }
}