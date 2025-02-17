import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ta_na_conta/app/modules/home/controllers/home_controller.dart';
import 'package:ta_na_conta/app/modules/payments/controllers/payments_controller.dart';
import 'package:ta_na_conta/app/services/connectivity_service.dart';
import 'package:ta_na_conta/app/theme/app_theme.dart';

import 'app/routes/app_pages.dart';

void main() {
  Get.put(HomeController());
  Get.put(PaymentsController());
  Get.put<ConnectivityService>(ConnectivityService());
  runApp(
    GetMaterialApp(
      theme: AppTheme.lightTheme,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
