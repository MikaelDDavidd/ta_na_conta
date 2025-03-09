import 'dart:async';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ta_na_conta/app/models/paymment_model.dart';

class HomeController extends GetxController {
  List<Payment> payments = [
    Payment(
      status: PaymentStatus.approved,
      amount: 100.0,
      date: DateTime.now().subtract(const Duration(days: 1)),
      recipientCPF: '11122233344',
      recipientName: 'Fulano de Tal',
      recipientInst: 'RecargaPay IP LTDA',
      payerCPF: '12345678900',
      payerName: 'João Silva',
      payerInst: 'Banco do Brasil',
    ),
    Payment(
      status: PaymentStatus.pending,
      amount: 50.0,
      date: DateTime.now().subtract(const Duration(days: 2)),
      recipientCPF: '11122233355',
      recipientName: 'Fulano de Tal 2',
      recipientInst: 'RecargaPay IP LTDA',
      payerCPF: '98765432100',
      payerName: 'Maria Oliveira',
      payerInst: 'Banco Santander',
    ),
    Payment(
      status: PaymentStatus.rejected,
      amount: 75.0,
      date: DateTime.now().subtract(const Duration(days: 3)),
      recipientCPF: '22233344455',
      recipientName: 'Fulano de Tal 3',
      recipientInst: 'RecargaPay IP LTDA',
      payerCPF: '11122233344',
      payerName: 'Carlos Souza',
      payerInst: 'Banco Inter',
    ),
    Payment(
      status: PaymentStatus.approved,
      amount: 1000.0,
      date: DateTime.now().subtract(const Duration(days: 1)),
      recipientCPF: '33344455566',
      recipientName: 'Fulano de Tal 4',
      recipientInst: 'RecargaPay IP LTDA',
      payerCPF: '12345678900',
      payerName: 'Mikael Silva',
      payerInst: 'Nubank',
    ),
    Payment(
      status: PaymentStatus.pending,
      amount: 50.0,
      date: DateTime.now().subtract(const Duration(days: 2)),
      recipientCPF: '44455566677',
      recipientName: 'Fulano de Tal 5',
      recipientInst: 'RecargaPay IP LTDA',
      payerCPF: '98765432100',
      payerName: 'Kaio Oliveira',
      payerInst: 'Banco Bradesco',
    ),
    Payment(
      status: PaymentStatus.rejected,
      amount: 75.0,
      date: DateTime.now().subtract(const Duration(days: 3)),
      recipientCPF: '55566677788',
      recipientName: 'Fulano de Tal 6',
      recipientInst: 'RecargaPay IP LTDA',
      payerCPF: '11122233344',
      payerName: 'Hudson Souza',
      payerInst: 'Banco do Brasil',
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
