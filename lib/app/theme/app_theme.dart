import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: AppBarTheme(
    backgroundColor: AppColors.background, // A cor de fundo
    elevation: 0, // Sem sombra
    shadowColor: Colors.transparent, // Remover sombra
    surfaceTintColor: Colors.transparent, // Sem tom adicional de superfície
    foregroundColor: AppColors.textPrimary, // Cor dos ícones e texto
    iconTheme: IconThemeData(color: AppColors.textPrimary), // Cor dos ícones
    titleTextStyle: TextStyle(
      color: AppColors.textPrimary, // Cor do título
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 40,
          fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(color: AppColors.textPrimary),
    ),
  );
}
