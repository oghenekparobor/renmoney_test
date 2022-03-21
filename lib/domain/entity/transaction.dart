class TransactionEntity {
  final String transactionId;
  final String type;
  final double amount;
  final String comment;
  final DateTime entryDate;
  final String currencyCode;
  final double balance;

  TransactionEntity({
    required this.transactionId,
    required this.amount,
    required this.type,
    required this.comment,
    required this.entryDate,
    required this.currencyCode,
    required this.balance,
  });
}
