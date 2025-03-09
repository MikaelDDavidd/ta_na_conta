import 'package:get/get.dart';
import 'package:ta_na_conta/app/modules/home/bindings/home_binding.dart';
import 'package:ta_na_conta/app/modules/home/views/home_view.dart';
import 'package:ta_na_conta/app/modules/login/controllers/login_controller.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/payments/bindings/payments_binding.dart';
import '../modules/payments/views/payments_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // initialPageSetter() {
  //   final loginController = Get.find<LoginController>();
  //   if (loginController.keepLogin) {
  //     return Routes.HOME;
  //   } else {
  //     return Routes.LOGIN;
  //   }
  // }

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: Duration(milliseconds: 400),
    ),
    GetPage(
      name: _Paths.PAYMENTS,
      page: () => const PaymentsView(),
      binding: PaymentsBinding(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: Duration(milliseconds: 400),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: Duration(milliseconds: 400),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: Duration(milliseconds: 400),
    ),
  ];
}
