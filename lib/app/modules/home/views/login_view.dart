import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:get/get.dart';
import 'package:ta_na_conta/app/data/app_assets.dart';
import 'package:ta_na_conta/app/data/app_strings.dart';
import 'package:ta_na_conta/app/theme/app_buttons.dart';
import 'package:ta_na_conta/app/theme/app_colors.dart';
import 'package:ta_na_conta/app/theme/app_text_styles.dart';
import '../controllers/home_controller.dart';


class LoginView extends GetView<HomeController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
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

              // Formulário
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: <Widget>[
                    FadeInUp(
                      duration: const Duration(milliseconds: 1800),
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.primary),
                          boxShadow: [
                            const BoxShadow(
                              color: Color.fromRGBO(101, 104, 172, 0.2),
                              blurRadius: 20.0,
                              offset: Offset(0, 10),
                            )
                          ],
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: AppColors.primary),
                                ),
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: AppStrings.emailString,
                                  hintStyle: AppTextStyles.hintText,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              child: Obx(() => TextField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: AppStrings.passwordString,
                                      hintStyle: AppTextStyles.hintText,
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          controller.isPasswordVisible.value
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Colors.grey,
                                        ),
                                        onPressed: () {
                                          controller.isPasswordVisible.toggle();
                                        },
                                      ),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Botão Login
                    FadeInUp(
                      duration: const Duration(milliseconds: 1900),
                      child: AppButtons.primaryButton(
                        text: AppStrings.loginString,
                        onPressed: () {
                          // Adicione a lógica de login aqui
                        },
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Esqueci a senha
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
            ],
          ),
        ),
      ),
    );
  }
}