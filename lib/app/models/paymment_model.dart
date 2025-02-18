/// Enum representing the different payment statuses.
enum PaymentStatus {
  pending,
  approved,
  rejected,
  cancelled,
}

/// Model class representing a Payment.
class Payment {
  final double value;
  final DateTime createdAt;
  final String payerName;
  final String payerDocument;
  final PaymentStatus status;

  const Payment({
    required this.value,
    required this.createdAt,
    required this.payerName,
    required this.payerDocument,
    required this.status,
  });

  /// Factory constructor to create a Payment object from JSON.
  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      value: json['value'] is int ? (json['value'] as int).toDouble() : json['value'] as double,
      createdAt: DateTime.parse(json['createdAt'] as String),
      payerName: json['payerName'] as String,
      payerDocument: json['payerDocument'] as String,
      status: _paymentStatusFromString(json['status'] as String),
    );
  }

  /// Converts the Payment object to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'value': value,
      'createdAt': createdAt.toIso8601String(),
      'payerName': payerName,
      'payerDocument': payerDocument,
      'status': status.toString().split('.').last,
    };
  }
}

/// Helper function to parse a PaymentStatus from a string.
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
