import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PaymentsController extends GetxController {
  var qrCode = "".obs;
  var pixValue = '0,00'.obs;
  var expirationValue = '5 minutos'.obs; // Valor do dropdown
  var timerDisplay = '5:00'.obs; // Valor do timer regressivo
  Timer? _timer;
  int _cents = 0;
  var timeLeft = 300.obs;

  final List<String> expirationOptions = [
    '1 minuto',
    '5 minutos',
    '10 minutos',
    '30 minutos',
    '1 hora',
    '12 horas',
    '24 horas',
  ];

  int getExpirationInSeconds(String expiration) {
    switch (expiration) {
      case '1 minuto':
        return 60;
      case '5 minutos':
        return 300;
      case '10 minutos':
        return 600;
      case '30 minutos':
        return 1800;
      case '1 hora':
        return 3600;
      case '12 horas':
        return 43200;
      case '24 horas':
        return 86400;
      default:
        return 300; // Valor padrão
    }
  }

  void setExpiration(String? newValue) {
    if (newValue != null) {
      expirationValue.value = newValue;
      // Se desejar, pode reiniciar o timer baseado na nova opção
    }
  }

  void onKeyPressed(String value) {
    if (value == '⌫') {
      _cents = _cents ~/ 10;
    } else {
      int digit = int.tryParse(value) ?? 0;
      _cents = _cents * 10 + digit;
    }
    pixValue.value = formatValue(_cents);
    updateQRCode();
  }

  void updateQRCode() {
    if (_cents > 0) {
      qrCode.value = "pix:${pixValue.value}";
    } else {
      qrCode.value = "";
    }
  }

  String formatValue(int cents) {
    final formatter = NumberFormat.currency(
      locale: 'pt_BR',
      symbol: '',
      decimalDigits: 2,
    );
    return formatter.format(cents / 100);
  }

  void startTimer() {
    _timer?.cancel();
    // Converte o valor selecionado para segundos
    int initialTime = getExpirationInSeconds(expirationValue.value);
    timeLeft.value = initialTime;
    timerDisplay.value = formatTime(); // Atualiza inicialmente

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeLeft.value > 0) {
        timeLeft.value--;
        timerDisplay.value = formatTime(); // Atualiza o timerDisplay
      } else {
        timer.cancel();
        qrCode.value = ""; // Expira o QR Code
      }
    });
  }

  String formatTime() {
    int minutes = timeLeft.value ~/ 60;
    int seconds = timeLeft.value % 60;
    return "$minutes:${seconds.toString().padLeft(2, '0')}";
  }

  void cancel() {
    Get.back();
    pixValue.value = '0,00';
    _timer?.cancel();
    _cents = 0;
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  void increment() => count.value++;
}
