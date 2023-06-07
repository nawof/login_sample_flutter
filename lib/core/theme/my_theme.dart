import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData get lightTheme => ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: const MaterialStatePropertyAll(
              Colors.blue,
            ),
            minimumSize: const MaterialStatePropertyAll(
              Size(
                double.maxFinite,
                56,
              ),
            ),
            elevation: const MaterialStatePropertyAll(8),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ),
      );

  static ThemeData get darkTheme => ThemeData(
        primarySwatch: const MaterialColor(
          0xFF000000,
          <int, Color>{
            50: Color(0xFFE3F2FD),
            100: Color(0xFFBBDEFB),
            200: Color(0xFF90CAF9),
            300: Color(0xFF64B5F6),
            400: Color(0xFF42A5F5),
            500: Color(0xFF000000),
            600: Color(0xFF1E88E5),
            700: Color(0xFF1976D2),
            800: Color(0xFF1565C0),
            900: Color(0xFF0D47A1),
          },
        ),
        scaffoldBackgroundColor: Colors.grey[900],
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.white,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: const TextStyle(color: Colors.white),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          outlineBorder: const BorderSide(
            color: Colors.white,
          ),
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: const MaterialStatePropertyAll(
              Color.fromARGB(255, 17, 17, 17),
            ),
            minimumSize: const MaterialStatePropertyAll(
              Size(
                double.maxFinite,
                56,
              ),
            ),
            shadowColor: const MaterialStatePropertyAll(
              Colors.grey,
            ),
            elevation: const MaterialStatePropertyAll(5),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ),
      );
}
