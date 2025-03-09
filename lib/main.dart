import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ta_na_conta/app/data/app_storage_keys.dart';
import 'package:ta_na_conta/app/modules/home/controllers/home_controller.dart';
import 'package:ta_na_conta/app/modules/login/controllers/login_controller.dart';
import 'package:ta_na_conta/app/modules/payments/controllers/payments_controller.dart';
import 'package:ta_na_conta/app/services/connectivity_service.dart';
import 'package:ta_na_conta/app/theme/app_theme.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final bool keepLogin = prefs.getBool(AppStorageKeys.keepLoginKey) ?? false;
  Get.put(HomeController());
  Get.put(PaymentsController());
  Get.put(LoginController());
  Get.put<ConnectivityService>(ConnectivityService());
  final initialRoute = keepLogin ? Routes.HOME : Routes.LOGIN;

  runApp(
    GetMaterialApp(
      theme: AppTheme.lightTheme,
      title: "Application",
      initialRoute: initialRoute,
      getPages: AppPages.routes,
    ),
  );
}
