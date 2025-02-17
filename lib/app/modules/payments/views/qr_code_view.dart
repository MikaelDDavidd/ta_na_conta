import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:ta_na_conta/app/data/app_assets.dart';
import 'package:ta_na_conta/app/data/app_strings.dart';
import 'package:ta_na_conta/app/modules/payments/controllers/payments_controller.dart';
import 'package:ta_na_conta/app/theme/app_buttons.dart';
import 'package:ta_na_conta/app/theme/app_decorations.dart';
import 'package:ta_na_conta/app/theme/app_colors.dart';
import 'package:ta_na_conta/app/theme/app_text_styles.dart';

class QrCodeView extends GetView<PaymentsController> {
  const QrCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          // Cabeçalho customizado
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back,
                      color: AppColors.secondary, size: 28),
                  onPressed: () => controller.cancel(),
                ),
                const Text(AppStrings.paymentTitle, style: AppTextStyles.title),
                IconButton(
                  icon: const Icon(Icons.info_outline,
                      color: AppColors.secondary, size: 28),
                  onPressed: () {
                    // Adicionar lógica para exibir informações
                  },
                ),
              ],
            ),
          ),
          Obx(
            () => Text(
              controller.timerDisplay.value,
              style: AppTextStyles.timer,
            ),
          ),

          const SizedBox(height: 20),

          // QR Code gerado
          Obx(() {
            if (controller.qrCode.value.isNotEmpty &&
                controller.timeLeft.value > 0) {
              return Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: AppDecorations.qrBorder,
                    child: QrImageView(
                      data: controller.qrCode.value,
                      version: QrVersions.auto,
                      size: 250,
                      embeddedImage: const AssetImage(AppAssets.qrLogo),
                      eyeStyle: const QrEyeStyle(
                        eyeShape:
                            QrEyeShape.square, // Pode ser 'circle' ou 'square'
                        color:
                            AppColors.textPrimary, // Cor dos olhos do QR Code
                      ),
                      dataModuleStyle: const QrDataModuleStyle(
                        dataModuleShape: QrDataModuleShape
                            .square, // Pode ser 'circle' ou 'square'
                        color:
                            AppColors.textPrimary, // Cor dos módulos de dados
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              );
            } else {
              return Column(
                children: [
                  const Text("QR Code expirado",
                      style: TextStyle(fontSize: 18, color: Colors.red)),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Gerar Novo QR Code"),
                  ),
                ],
              );
            }
          }),

          const SizedBox(height: 20),
          Text(AppStrings.toPayString, style: AppTextStyles.hintText),

          // Valor do Pix
          Obx(() {
            return Text(
              "R\$ ${controller.pixValue.value}",
              style: AppTextStyles.body,
            );
          }),

          const Spacer(),

          // Botões
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: AppButtons.primaryButton(
                    text: AppStrings.shareQrString,
                    onPressed: () {},
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  child: AppButtons.secondaryButton(
                    text: AppStrings.copyAndPasteString,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
