import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    textTheme: const TextTheme(
      headlineMedium: TextStyle(color: AppColors.textPrimary, fontSize: 40, fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(color: AppColors.textPrimary),
    ),
  );
}