import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  static const title = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static const body = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
  static const timer = TextStyle(
    color: AppColors.tertiary,
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
  static const receiptTitle = TextStyle(
    color: AppColors.tertiary,
    fontSize: 25,
    fontWeight: FontWeight.bold,
  );
  static const wheelTitle= TextStyle(
    color: AppColors.textPrimary,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
  static const wheelItem = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static const wheelSelectedItem = TextStyle(
    color: AppColors.tertiary,
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );

  static const hintText = TextStyle(
    color: AppColors.textSecondary,
  );

  static const buttonText = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
}