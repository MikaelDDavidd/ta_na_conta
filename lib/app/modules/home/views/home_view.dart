import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ta_na_conta/app/models/paymment_model.dart';
import 'package:ta_na_conta/app/modules/home/controllers/home_controller.dart';
import 'package:ta_na_conta/app/theme/app_buttons.dart';
import 'package:ta_na_conta/app/theme/app_colors.dart';
import 'package:ta_na_conta/app/theme/app_decorations.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Payment> payments = controller.payments;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Main scrollable content.
            CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(child: SizedBox(height: 60)),
                const SliverToBoxAdapter(
                  child: Image(image: AssetImage(""),),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: AppButtons.sellingButton(
                      text: "Venda",
                      onPressed: () {},
                    ),
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 20)),
                // Payment List
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final payment = payments[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 8),
                        child: Container(
                          decoration: AppDecorations.saleItemBox,
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            title: Text(
                              'R\$ ${payment.value.toStringAsFixed(2)}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            subtitle: Text(
                              'Pago por: ${payment.payerName}\n'
                              'Documento: ${payment.payerDocument}\n'
                              'Data: ${payment.createdAt.toLocal().toString().split(" ")[0]}\n'
                              'Status: ${payment.status.toString().split(".").last}',
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    childCount: payments.length,
                  ),
                ),
              ],
            ),
            // Menu actions overlay (top-right corner)
            Positioned(
              top: 5,
              right: 16,
              child: PopupMenuButton<String>(
                icon: const Icon(Icons.more_vert, color: AppColors.primary),
                onSelected: (value) {
                  // Handle menu selection
                  debugPrint("Selected: $value");
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: 'option1',
                    child: Text('Option 1'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'option2',
                    child: Text('Option 2'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'option3',
                    child: Text('Option 3'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
