import 'package:demo_2/data/model/transaction.dart';
import 'package:demo_2/presentation/views/details.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionTile extends StatelessWidget {
  const TransactionTile({
    Key? key,
    required this.tm,
  }) : super(key: key);

  final TransactionModel tm;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        onTap: () => Navigator.of(context).pushNamed(
          DetailPage.route,
          arguments: tm,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        tileColor: Colors.deepPurple.shade50.withOpacity(.5),
        title: Text(
          tm.comment,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: Container(
          decoration: BoxDecoration(
            color: tm.type == 'DEPOSIT'
                ? Colors.green.shade100
                : Colors.deepPurple.shade100,
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(15),
          child: Icon(
            tm.type == 'DEPOSIT' ? Icons.arrow_upward : Icons.arrow_downward,
            color: tm.type == 'DEPOSIT' ? Colors.green : Colors.deepPurple,
            size: 18,
          ),
        ),
        subtitle: Text(DateFormat.yMMMEd().format(tm.entryDate)),
        trailing: Text(
          '₦ ${tm.amount}',
          style: TextStyle(
            color: tm.type == 'DEPOSIT' ? Colors.green : Colors.red,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
