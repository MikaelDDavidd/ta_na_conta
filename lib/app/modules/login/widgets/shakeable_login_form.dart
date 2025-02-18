import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ta_na_conta/app/data/app_strings.dart';
import 'package:ta_na_conta/app/theme/app_colors.dart';
import 'package:ta_na_conta/app/theme/app_text_styles.dart';
import 'package:ta_na_conta/app/modules/login/controllers/login_controller.dart';
import 'shake_widget.dart';

class ShakeableLoginForm extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const ShakeableLoginForm({
    Key? key,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  @override
  ShakeableLoginFormState createState() => ShakeableLoginFormState();
}

class ShakeableLoginFormState extends State<ShakeableLoginForm> {
  Key shakeKey = GlobalKey();

  void triggerShake() {
    setState(() {
      shakeKey = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    final loginController = Get.find<LoginController>();
    return ShakeWidget(
      key: shakeKey,
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.primary),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(101, 104, 172, 0.2),
              blurRadius: 20.0,
              offset: Offset(0, 10),
            )
          ],
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: AppColors.primary),
                ),
              ),
              child: TextField(
                controller: widget.emailController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: AppStrings.emailString,
                  hintStyle: AppTextStyles.hintText,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Obx(
                () => TextField(
                  controller: widget.passwordController,
                  obscureText: !loginController.isPasswordVisible.value,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: AppStrings.passwordString,
                    hintStyle: AppTextStyles.hintText,
                    suffixIcon: IconButton(
                      icon: Icon(
                        loginController.isPasswordVisible.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        loginController.isPasswordVisible.toggle();
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}