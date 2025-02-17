import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ta_na_conta/app/exceptions/app_exceptions.dart';
import 'package:ta_na_conta/app/services/connectivity_service.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var isPasswordVisible = false.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  static const String fakeEmail = "mikael@gmail.com";
  static const String fakePassword = "123456";
  var errorMessage = ''.obs;

  /// Valida o formato do e-mail
  bool isValidEmail(String email) {
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regex.hasMatch(email);
  }

  /// Verifica conexão com a internet antes do login
  Future<bool> checkConnectivity() async {
    final connectivityService = Get.find<ConnectivityService>();
    try {
      await connectivityService.requireConnectivity();
      return true;
    } on NoInternetException catch (e) {
      errorMessage.value = e.message;
      return false;
    } catch (e) {
      errorMessage.value = "Erro inesperado ao verificar conexão.";
      return false;
    }
  }

  /// Valida credenciais e internet antes de permitir login
  Future<bool> validateCredentials() async {
    isLoading.value = true; // Ativa loading

    final email = emailController.text.trim();
    final password = passwordController.text;

    // Valida formato do e-mail
    if (!isValidEmail(email)) {
      errorMessage.value = "Formato de e-mail inválido.";
      isLoading.value = false;
      return false;
    }

    // Valida usuário e senha fake (simulação)
    if (email.toLowerCase() != fakeEmail) {
      errorMessage.value = "E-mail incorreto.";
      isLoading.value = false;
      return false;
    }
    if (password != fakePassword) {
      errorMessage.value = "Senha incorreta.";
      isLoading.value = false;
      return false;
    }

    // Verifica conexão antes do login
    if (!await checkConnectivity()) {
      isLoading.value = false;
      return false;
    }

    // Reseta erros e retorna sucesso
    errorMessage.value = "";
    isLoading.value = false;
    return true;
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}