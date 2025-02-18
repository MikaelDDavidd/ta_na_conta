import 'dart:async';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ta_na_conta/app/models/paymment_model.dart';

class HomeController extends GetxController {
    List<Payment> payments = [
    Payment(
      value: 100.0,
      createdAt: DateTime.now().subtract(Duration(days: 1)),
      payerName: "João Silva",
      payerDocument: "12345678900",
      status: PaymentStatus.approved,
    ),
    Payment(
      value: 50.0,
      createdAt: DateTime.now().subtract(Duration(days: 2)),
      payerName: "Maria Oliveira",
      payerDocument: "98765432100",
      status: PaymentStatus.pending,
    ),
    Payment(
      value: 75.0,
      createdAt: DateTime.now().subtract(Duration(days: 3)),
      payerName: "Carlos Souza",
      payerDocument: "11122233344",
      status: PaymentStatus.rejected,
    ),
  ];


  @override
  void onInit() {
    super.onInit();
  }


  @override
  void onClose() {
    super.onClose();
  }
}
