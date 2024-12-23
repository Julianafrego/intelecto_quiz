import 'package:flutter/material.dart';
import 'package:intelecto_quiz/core/system_colors.dart';
class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      scaffoldBackgroundColor: SystemColors.rose3,
      primarySwatch: Colors.blue, 
      

      appBarTheme: const AppBarTheme(
        backgroundColor: SystemColors.rose3, 
        centerTitle: true, 
        foregroundColor: SystemColors.white, 
      ),

      textTheme:const TextTheme(
        displayLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: SystemColors.white), // Títulos
        bodyLarge: TextStyle(fontSize: 16, color: SystemColors.white), // Texto do corpo
        bodyMedium: TextStyle(fontSize: 14, color: SystemColors.white), // Texto secundário
      ),
    );
  }
}
