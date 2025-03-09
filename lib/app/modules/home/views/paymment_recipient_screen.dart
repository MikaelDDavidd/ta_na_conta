import 'dart:typed_data';
import 'dart:ui' as ui; // Para capturar a imagem do RepaintBoundary
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:sks_ticket_view/sks_ticket_view.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:ta_na_conta/app/data/app_assets.dart';
import 'package:ta_na_conta/app/models/paymment_model.dart';
import 'package:ta_na_conta/app/theme/app_buttons.dart';
import 'package:ta_na_conta/app/theme/app_colors.dart';
import 'package:ta_na_conta/app/theme/app_text_styles.dart';

class PaymmentRecipientScreen extends StatefulWidget {
  final Payment transaction;

  const PaymmentRecipientScreen({Key? key, required this.transaction})
      : super(key: key);

  @override
  State<PaymmentRecipientScreen> createState() => _PaymmentRecipientScreenState();
}

class _PaymmentRecipientScreenState extends State<PaymmentRecipientScreen> {
  /// Chave global para capturar o widget com RepaintBoundary
  final GlobalKey _globalKey = GlobalKey();

  bool get isApproved => widget.transaction.status == PaymentStatus.approved;

  String getStatus(PaymentStatus status) {
    switch (status) {
      case PaymentStatus.approved:
        return "Aprovado";
      case PaymentStatus.pending:
        return "Pendente";
      case PaymentStatus.cancelled:
        return "Cancelado";
      case PaymentStatus.rejected:
        return "Rejeitado";
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comprovante de Transação'),
      ),
      body: Column(
        children: [
          // Parte rolável do conteúdo
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: RepaintBoundary(
                key: _globalKey, // <--- Envolva seu layout no RepaintBoundary
                child: SKSTicketView(
                  backgroundPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                  backgroundColor: AppColors.background,
                  contentBackgroundColor: AppColors.primary,
                  drawShadow: false,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 24, horizontal: 0),
                  drawArc: false,
                  triangleAxis: Axis.vertical,
                  borderRadius: 6,
                  drawDivider: false,
                  trianglePos: .0,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Image.asset(
                            AppAssets.loginLogo,
                            width: 150,
                          ),
                        ),
                        Center(
                          child: SizedBox(
                            width: double.infinity,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                'Comprovante de Transação',
                                style: AppTextStyles.receiptTitle,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Status: ${getStatus(widget.transaction.status)}',
                          style: AppTextStyles.title,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Valor: R\$ ${widget.transaction.amount.toStringAsFixed(2)}',
                          style: AppTextStyles.title,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Data: ${DateFormat("dd/MM/yyyy HH:mm:ss").format(widget.transaction.date)}',
                          style: AppTextStyles.hintText,
                        ),
                        if (isApproved) ...[
                          const SizedBox(height: 16),
                          const Divider(),
                          const SizedBox(height: 16),
                          Text(
                            'Destinatário',
                            style: AppTextStyles.title,
                          ),
                          Text(
                            'CPF: ${widget.transaction.recipientCPF}',
                            style: AppTextStyles.hintText,
                          ),
                          Text(
                            'Instituição: ${widget.transaction.recipientInst}',
                            style: AppTextStyles.hintText,
                          ),
                          const SizedBox(height: 16),
                          const Divider(),
                          const SizedBox(height: 16),
                          Text(
                            'Pagador',
                            style: AppTextStyles.title,
                          ),
                          Text(
                            'CPF: ${widget.transaction.payerCPF}',
                            style: AppTextStyles.hintText,
                          ),
                          Text(
                            'Instituição: ${widget.transaction.payerInst}',
                            style: AppTextStyles.hintText,
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Botões fixos no rodapé
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: AppButtons.primaryButton(
                    text: "Salvar Comprovante",
                    onPressed: _onSavePdf,
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  child: AppButtons.secondaryButton(
                    text: "Compartilhar Comprovante",
                    onPressed: _onSharePdf,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 1) Captura o widget como imagem (PNG)
  /// 2) Cria um documento PDF contendo essa imagem
  /// 3) Retorna os bytes do PDF
  Future<Uint8List> _captureWidgetAsPdf() async {
    // 1) Acessa o RenderRepaintBoundary
    final boundary =
        _globalKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;
    if (boundary == null) {
      throw Exception("Não foi possível encontrar o boundary do widget");
    }

    // Aumente o pixelRatio para ter maior qualidade (e maior tamanho de arquivo)
    final image = await boundary.toImage(pixelRatio: 3.0);
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    final pngBytes = byteData!.buffer.asUint8List();

    // 2) Monta um documento PDF usando a lib 'pdf'
    final pdf = pw.Document();
    final pdfImage = pw.MemoryImage(pngBytes);

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          // Exemplo simples: centraliza a imagem
          return pw.Center(
            child: pw.Image(pdfImage),
          );
        },
      ),
    );

    // 3) Retorna os bytes do PDF
    return pdf.save();
  }

  /// Salvar o PDF via diálogo nativo (Android/iOS/desktop)
  /// onde o usuário pode imprimir ou salvar como PDF.
  Future<void> _onSavePdf() async {
    try {
      final pdfBytes = await _captureWidgetAsPdf();

      await Printing.layoutPdf(
        onLayout: (format) => Future.value(pdfBytes),
      );
    } catch (e) {
      debugPrint('Erro ao salvar PDF: $e');
    }
  }

  /// Compartilhar o PDF via apps do sistema (WhatsApp, Email, etc.)
  Future<void> _onSharePdf() async {
    try {
      final pdfBytes = await _captureWidgetAsPdf();

      await Printing.sharePdf(
        bytes: pdfBytes,
        filename: 'comprovante.pdf',
      );
    } catch (e) {
      debugPrint('Erro ao compartilhar PDF: $e');
    }
  }
}
