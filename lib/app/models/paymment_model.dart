/// Enum representing the different payment statuses.
enum PaymentStatus {
  pending,
  approved,
  rejected,
  cancelled,
}

/// Model class representing a Payment.
class Payment {
  final PaymentStatus status;   // Enum de status (pending, approved, etc.)
  final double amount;          // Valor da transação
  final DateTime date;          // Data da transação
  final String recipientCPF;    // CPF do destinatário
  final String recipientName;   // Nome do destinatário
  final String recipientInst;   // Instituição do destinatário
  final String? payerCPF;       // CPF do pagador (opcional)
  final String? payerName;      // Nome do pagador (opcional)
  final String? payerInst;      // Instituição do pagador (opcional)

  Payment({
    required this.status,
    required this.amount,
    required this.date,
    required this.recipientCPF,
    required this.recipientName,
    required this.recipientInst,
    this.payerCPF,
    this.payerName,
    this.payerInst,
  });

  /// Factory constructor para criar um Payment a partir de JSON.
  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      status: _paymentStatusFromString(json['status']),
      amount: json['amount'] is int
          ? (json['amount'] as int).toDouble()
          : json['amount'] as double,
      date: DateTime.parse(json['date'] as String),

      // Esses campos podem ser nulos no JSON (dependendo da resposta do servidor).
      // Se tiver certeza de que não são nulos, pode remover o '?'
      payerName: json['payerName'] as String?,
      payerCPF: json['payerCPF'] as String?,
      payerInst: json['payerInst'] as String?,

      recipientName: json['recipientName'] as String,
      recipientCPF: json['recipientCPF'] as String,
      recipientInst: json['recipientInst'] as String,
    );
  }

  /// Converte o objeto Payment para JSON.
  Map<String, dynamic> toJson() {
    return {
      // Pegamos apenas a parte final do enum, por exemplo "approved", "pending", etc.
      'status': status.toString().split('.').last,
      'amount': amount,
      'date': date.toIso8601String(),
      'payerName': payerName,
      'payerCPF': payerCPF,
      'payerInst': payerInst,
      'recipientName': recipientName,
      'recipientCPF': recipientCPF,
      'recipientInst': recipientInst,
    };
  }
}

/// Função auxiliar para converter string em PaymentStatus.
PaymentStatus _paymentStatusFromString(String status) {
  switch (status.toLowerCase()) {
    case 'pending':
      return PaymentStatus.pending;
    case 'approved':
      return PaymentStatus.approved;
    case 'rejected':
      return PaymentStatus.rejected;
    case 'cancelled':
      return PaymentStatus.cancelled;
    default:
      return PaymentStatus.pending;
  }
}
