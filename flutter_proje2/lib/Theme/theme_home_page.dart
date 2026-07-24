import 'package:flutter/material.dart';

class ThemeHomePage {
  static ThemeData theme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.green,
      surface: const Color.fromARGB(255, 162, 188, 199),
      brightness: Brightness.light,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.lightGreen.shade300,
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 10,
      titleTextStyle: TextStyle(
        fontSize: 25,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    ),
    cardTheme: CardThemeData(color: const Color.fromARGB(255, 229, 228, 228)),
  );
}
