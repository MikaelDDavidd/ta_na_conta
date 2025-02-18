import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ta_na_conta/app/exceptions/app_exceptions.dart';
import 'package:ta_na_conta/app/services/connectivity_service.dart';

class LoginController extends GetxController {
  var shakeable = 1.0.obs;
  var isLoading = false.obs;
  var isPasswordVisible = false.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  static const String fakeEmail = "mikael@gmail.com";
  static const String fakePassword = "123456";
  var errorMessage = ''.obs;

  bool isValidEmail(String email) {
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regex.hasMatch(email);
  }

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

  Future<bool> validateCredentials() async {
    isLoading.value = true;

    final email = emailController.text.trim();
    final password = passwordController.text;

    if (!isValidEmail(email)) {
      errorMessage.value = "Formato de e-mail inválido.";
      isLoading.value = false;
      return false;
    }

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

    if (!await checkConnectivity()) {
      isLoading.value = false;
      return false;
    }

    errorMessage.value = "";
    isLoading.value = false;
    return true;
  }

  void makeItShakeable() {
    shakeable.value = 0.0;
  }

  void makeItUnShakeable() {
    shakeable.value = 1.0;
  }

  @override
  void onInit() {
    makeItUnShakeable();
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
