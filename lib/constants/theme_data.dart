import 'package:flutter/material.dart';

final lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.green,
      foregroundColor: Colors.white,
    ),
    primaryColor: Colors.black);

final darkTheme = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.green,
      foregroundColor: Colors.white,
    ),
    canvasColor: const Color.fromARGB(255, 19, 20, 29),
    primaryColor: Colors.white,
    scaffoldBackgroundColor: const Color.fromARGB(255, 19, 20, 29),
    bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.black),
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(color: Colors.white),
      labelStyle: TextStyle(color: Colors.white),
    ));

// extension CustomThemeData on ThemeData {
//   Color get backgroundColor => brightness == Brightness.light
//       ? Colors.grey[200]! // Light theme background
//       : Colors.grey[800]!; // Dark theme background
// }
