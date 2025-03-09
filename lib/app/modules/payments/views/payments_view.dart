import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ta_na_conta/app/modules/payments/controllers/payments_controller.dart';
import 'package:ta_na_conta/app/modules/payments/views/qr_code_view.dart';
import 'package:ta_na_conta/app/theme/app_buttons.dart';
import 'package:ta_na_conta/app/theme/app_colors.dart';
import 'package:ta_na_conta/app/theme/app_text_styles.dart';
import 'package:time_picker_sheet/widget/sheet.dart';
import 'package:time_picker_sheet/widget/time_picker.dart';

class PaymentsView extends GetView<PaymentsController> {
  const PaymentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentsController>(
      init: PaymentsController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.background,
          appBar: AppBar(actions: [
            IconButton(
              onPressed: () {
                TimePicker.show(
                  context: context,
                  sheet: TimePickerSheet(
                    sheetCloseIconColor: AppColors.tertiary,
                    saveButtonColor: AppColors.tertiary,
                    hourTitleStyle: AppTextStyles.wheelTitle,
                    minuteTitleStyle: AppTextStyles.wheelTitle,
                    sheetTitleStyle: AppTextStyles.title,
                    wheelNumberItemStyle: AppTextStyles.wheelItem,
                    wheelNumberSelectedStyle: AppTextStyles.wheelSelectedItem,
                    sheetTitle: 'Tempo de validade',
                    hourTitle: 'Hora',
                    minuteTitle: 'Minuto',
                    saveButtonText: 'Definir',
                  ),
                );
              },
              icon: Icon(
                Icons.timer,
                size: 30,
              ),
            ),
          ]),
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Exibição do valor digitado
                      Obx(() => Text(
                            "R\$ ${controller.pixValue.value.isEmpty ? '0,00' : controller.pixValue.value}",
                            style: AppTextStyles.title.copyWith(fontSize: 40),
                          )),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.edit),
                      ),Text("Descrição")],
                      ),
                      
                      const SizedBox(height: 40),

                      // Teclado Numérico
                      _buildNumericKeyboard(controller),
                    ],
                  ),
                ),

                // Botão fixado no rodapé
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: SizedBox(
                    width: double.infinity,
                    child: AppButtons.secondaryButton(
                      text: 'Continuar',
                      onPressed: () {
                        controller.startTimer();
                        Get.to(
                          () => const QrCodeView(),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildNumericKeyboard(PaymentsController controller) {
    return Column(
      children: [
        for (var row in [
          ['1', '2', '3'],
          ['4', '5', '6'],
          ['7', '8', '9'],
          ['', '0', '⌫']
        ])
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: row.map((value) {
              return _buildKey(value, controller);
            }).toList(),
          ),
      ],
    );
  }

  Widget _buildKey(String value, PaymentsController controller) {
    return AppButtons.keyboardKey(
      value: value,
      onPressed: () => controller.onKeyPressed(value),
    );
  }
}
