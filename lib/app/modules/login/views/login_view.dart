import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ta_na_conta/app/data/app_assets.dart';
import 'package:ta_na_conta/app/data/app_strings.dart';
import 'package:ta_na_conta/app/modules/login/controllers/login_controller.dart';
import 'package:ta_na_conta/app/modules/login/widgets/shakeable_login_form.dart';
import 'package:ta_na_conta/app/modules/payments/views/payments_view.dart';
import 'package:ta_na_conta/app/theme/app_buttons.dart';
import 'package:ta_na_conta/app/theme/app_colors.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shakeFormKey = GlobalKey<ShakeableLoginFormState>();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              // Logo
              FadeInUp(
                duration: const Duration(seconds: 1),
                child: Container(
                  width: 350,
                  height: 200,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppAssets.loginLogo),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              // Formulário com efeito Shake customizado
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    ShakeableLoginForm(
                      key: shakeFormKey,
                      emailController: controller.emailController,
                      passwordController: controller.passwordController,
                    ),
                    Obx(() => controller.errorMessage.value.isNotEmpty
                        ? Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              controller.errorMessage.value,
                              style: const TextStyle(color: Colors.red),
                            ),
                          )
                        : const SizedBox.shrink()),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              // Botão de Login
              FadeInUp(
                duration: const Duration(milliseconds: 1900),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Obx(() => AppButtons.loginButton(
                        text: AppStrings.loginString,
                        onPressed: () async {
                          controller.isLoading.value = true;
                          if (!(await controller.validateCredentials())) {
                            shakeFormKey.currentState?.triggerShake();
                          } else {
                            Get.to(() => const PaymentsView());
                          }
                          controller.isLoading.value = false;
                        },
                        isLoading: controller
                            .isLoading.value, // Passa o estado de carregamento
                      )),
                ),
              ),
              const SizedBox(height: 20),
              // Botão "Esqueci a senha"
              FadeInUp(
                duration: const Duration(milliseconds: 2000),
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    AppStrings.forotPasswordString,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
