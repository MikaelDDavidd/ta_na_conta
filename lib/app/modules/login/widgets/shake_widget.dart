import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ta_na_conta/app/modules/login/controllers/login_controller.dart';

/// Widget customizado para efeito de shake.
class ShakeWidget extends StatelessWidget {
  final Duration duration;
  final double deltaX;
  final Widget child;
  final Curve curve;

  const ShakeWidget({
    Key? key,
    this.duration = const Duration(milliseconds: 500),
    this.deltaX = 20,
    this.curve = Curves.bounceOut,
    required this.child,
  }) : super(key: key);

  /// Converte um valor de 0 a 1 em um valor que sobe e desce (0-1-0)
  double shake(double animation) =>
      2 * (0.5 - (0.5 - curve.transform(animation)).abs());

  @override
  Widget build(BuildContext context) {
    final loginController = Get.find<LoginController>();
    return Obx(() {
      double value = loginController.shakeable.value;
      return TweenAnimationBuilder<double>(
        tween: Tween(begin: value, end: 1.0),
        duration: duration,
        builder: (context, animation, child) => Transform.translate(
          offset: Offset(deltaX * shake(animation), 0),
          child: child,
        ),
        child: child,
        onEnd: loginController.makeItUnShakeable,
      );
    });
  }
}
