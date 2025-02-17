import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

class AppButtons {
  static Widget primaryButton(
      {required String text, required VoidCallback onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.primary,
        ),
        child: Center(
          child: Text(
            text,
            style: AppTextStyles.buttonText,
          ),
        ),
      ),
    );
  }

  static Widget secondaryButton(
      {required String text, required VoidCallback onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.tertiary,
        ),
        child: Center(
          child: Text(
            text,
            style: AppTextStyles.buttonText,
          ),
        ),
      ),
    );
  }

  static Widget loginButton({
    required String text,
    required VoidCallback onPressed,
    required bool isLoading, // Adicionamos esse parâmetro
  }) {
    return GestureDetector(
      onTap: isLoading ? null : onPressed, // Desativa enquanto carrega
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.primary,
        ),
        child: Center(
          child: isLoading
              ? const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 3,
                  ),
                ) // Ícone de carregamento
              : Text(
                  text,
                  style: AppTextStyles.buttonText,
                ),
        ),
      ),
    );
  }

  static Widget keyboardKey({
    required String value,
    required VoidCallback onPressed,
  }) {
    bool isEmptyOrDelete = value == '' || value == '⌫';
    final ValueNotifier<bool> isPressed = ValueNotifier(false);

    return ValueListenableBuilder<bool>(
      valueListenable: isPressed,
      builder: (context, pressed, child) {
        return GestureDetector(
          onTapDown: (_) => isPressed.value = true,
          onTapUp: (_) {
            isPressed.value = false;
            onPressed();
          },
          onTapCancel: () => isPressed.value = false,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            margin: const EdgeInsets.all(10),
            width: 90,
            height: 90,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isEmptyOrDelete
                  ? Colors.transparent
                  : (pressed
                      ? AppColors.primary.withOpacity(0.6)
                      : AppColors.primary),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: isEmptyOrDelete ? Radius.zero : Radius.circular(10),
                bottomRight:
                    isEmptyOrDelete ? Radius.zero : Radius.circular(10),
              ),
              border: Border.all(
                color: isEmptyOrDelete
                    ? Colors.transparent
                    : Colors.black.withOpacity(0.2),
                width: 1,
              ),
            ),
            child: Text(
              value,
              style: const TextStyle(fontSize: 30, color: Colors.white),
            ),
          ),
        );
      },
    );
  }
}
