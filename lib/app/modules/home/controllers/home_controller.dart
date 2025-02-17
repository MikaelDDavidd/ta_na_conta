import 'dart:async';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  var isPasswordVisible = false.obs;
  var qrCode = "".obs;
  var timerDisplay = '5 minutos'.obs;
  var pixValue = '0,00'.obs; // Valor formatado do Pix
  var timeLeft = 300.obs;

  var expirationValue = '5 minutos'.obs;


  @override
  void onInit() {
    qrCode.value =
        "lakjdlkjsakllkasjjdjaskldlaskdasjkdljklsajdjkljj"; // QR inicial
    super.onInit();
  }


  @override
  void onClose() {
    super.onClose();
  }
}
