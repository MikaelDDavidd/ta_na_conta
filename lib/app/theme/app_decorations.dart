import 'package:flutter/material.dart';
import 'package:ta_na_conta/app/theme/app_text_styles.dart';
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
    color: Colors.transparent, // Sem fundo
    border: Border(
      top: BorderSide(
          color: const Color.fromARGB(132, 255, 255, 255), width: 0.8),
    ),
  );

  static InputDecoration searchFieldDecoration = InputDecoration(
    hintText: "Pesquisar...",
    hintStyle: AppTextStyles.hintText,
    filled: true,
    fillColor: Colors.transparent, // Fundo transparente
    contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8), // Bordas levemente arredondadas
      borderSide: const BorderSide(
        color: AppColors.tertiary, // Cor da borda
        width: 1.0,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: AppColors.tertiary,
        width: 1.0,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: AppColors.tertiary,
        width: 2.0,
      ),
    ),
    prefixIcon: const Icon(
      Icons.search,
      color: AppColors.textSecondary,
    ),
  );
}
