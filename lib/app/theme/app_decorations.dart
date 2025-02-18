import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppDecorations {
  static BoxDecoration loginBox = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
    border: Border.all(color: AppColors.primary),
    boxShadow: const [
      BoxShadow(
        color: Color.fromRGBO(101, 104, 172, 0.2),
        blurRadius: 20.0,
        offset: Offset(0, 10),
      ),
    ],
  );

  static BoxDecoration inputFieldDecoration = const BoxDecoration(
    border: Border(
      bottom: BorderSide(color: AppColors.primary),
    ),
  );

  static BoxDecoration qrBorder = BoxDecoration(
    color: Colors.transparent,
    borderRadius: BorderRadius.circular(12),
    border: Border.all(
      color: AppColors.tertiary,
      width: 3,
    ),
  );

  // New decoration for sale list items in HomeView.
  static BoxDecoration saleItemBox = BoxDecoration(
    color: AppColors.primary,
    borderRadius: BorderRadius.circular(10),
  );
}
