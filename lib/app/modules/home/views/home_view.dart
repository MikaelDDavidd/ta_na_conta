import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ta_na_conta/app/data/app_assets.dart';
import 'package:ta_na_conta/app/models/paymment_model.dart';
import 'package:ta_na_conta/app/modules/home/controllers/home_controller.dart';
import 'package:ta_na_conta/app/modules/home/views/paymment_recipient_screen.dart';
import 'package:ta_na_conta/app/modules/login/controllers/login_controller.dart';
import 'package:ta_na_conta/app/modules/payments/views/payments_view.dart';
import 'package:ta_na_conta/app/routes/app_pages.dart';
import 'package:ta_na_conta/app/theme/app_buttons.dart';
import 'package:ta_na_conta/app/theme/app_colors.dart';
import 'package:ta_na_conta/app/theme/app_decorations.dart';
import 'package:ta_na_conta/app/theme/app_text_styles.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.find<LoginController>();
    List<Payment> payments = controller.payments;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        flexibleSpace: SafeArea(
          child: Image(
            image: AssetImage(AppAssets.loginLogo),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              loginController.makeLoginNoKeep();
              Get.toNamed(Routes.LOGIN);
            },
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: AppButtons.sellingButton(
                text: "Venda",
                onPressed: () {
                  Get.toNamed(Routes.PAYMENTS);
                },
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverToBoxAdapter(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  style: AppTextStyles.hintText,
                  decoration: AppDecorations.searchFieldDecoration,
                )),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          // Payment List
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final payment = payments[index];
                return Stack(
                  children: [
                    // Seu conteúdo existente
                    Container(
                      decoration: AppDecorations.saleItemBox,
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 8),
                        leading: Icon(
                          payment.status == PaymentStatus.approved
                              ? Icons.check_circle
                              : payment.status == PaymentStatus.pending
                                  ? Icons.hourglass_empty
                                  : Icons.cancel,
                          color: payment.status == PaymentStatus.approved
                              ? AppColors.primary
                              : payment.status == PaymentStatus.pending
                                  ? AppColors.primary
                                  : AppColors.primary,
                          size: 32,
                        ),
                        title: Text(
                          payment.status == PaymentStatus.approved
                              ? 'Venda realizada'
                              : payment.status == PaymentStatus.pending
                                  ? 'Venda pendente'
                                  : 'Venda cancelada',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        subtitle: Text(
                          'Pago por: ${payment.payerName}\n'
                          'R\$ ${payment.amount.toStringAsFixed(2)}',
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                        onTap: () {
                          // Navegação usando GetX:
                          Get.to(
                            () => PaymmentRecipientScreen(
                              transaction: Payment(
                                status: payment.status, // ou 'pending', 'canceled'
                                amount: payment.amount,
                                date: payment.date,
                                recipientName: payment.recipientName,
                                recipientCPF: payment.recipientCPF,
                                recipientInst: payment.recipientInst,
                                payerName: payment.payerName,
                                payerCPF: payment.payerCPF,
                                payerInst: payment.payerInst,
                              ),
                            ),
                            transition: Transition
                                .rightToLeft, // opcional: define uma transição personalizada
                          );
                        },
                      ),
                    ),

                    // Texto "15 fev" no canto superior direito, meio apagado para cada item
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Opacity(
                        opacity: 0.5, // Ajuste a opacidade aqui
                        child: Text(
                          "15 fev", // Texto fixo ou você pode torná-lo dinâmico conforme necessário
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
              childCount: payments
                  .length, // Certifique-se de que o número de itens é passado corretamente
            ),
          )
        ],
      ),
    );
  }
}
