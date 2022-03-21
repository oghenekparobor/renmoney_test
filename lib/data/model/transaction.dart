import 'package:demo_2/domain/entity/transaction.dart';

class TransactionModel extends TransactionEntity {
  TransactionModel(
      {required String transactionId,
      required double amount,
      required String type,
      required String comment,
      required DateTime entryDate,
      required String currencyCode,
      required double balance})
      : super(
            transactionId: transactionId,
            amount: amount,
            type: type,
            comment: comment,
            entryDate: entryDate,
            currencyCode: currencyCode,
            balance: balance);

  factory TransactionModel.fromJson(Map<String, dynamic> map) {
    return TransactionModel(
      transactionId: map['transactionId'].toString(),
      amount: map['amount'],
      type: map['type'],
      comment: map['comment'] ?? '',
      entryDate: DateTime.parse(map['entryDate']),
      currencyCode: map['currencyCode'],
      balance: double.parse(map['balance']),
    );
  }

  Map<String, dynamic> toJson() => {
        'transactionId': transactionId,
        'type': type,
        'amount': amount,
        'comment': comment,
        'entryDate': entryDate.toIso8601String(),
        'currencyCode': currencyCode,
        'balance': balance.toString()
      };
}
