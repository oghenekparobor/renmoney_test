import 'package:demo_2/data/model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatelessWidget {
  static const route = '/detail_page';
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tm = ModalRoute.of(context)!.settings.arguments as TransactionModel;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: Colors.deepPurple.shade300,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          physics: const ClampingScrollPhysics(),
          children: [
            const Text(
              'Transaction details',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 15),
                  Text(
                    'Detailed summary of transaction',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: const [
                      Text(
                        'Recepient',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      Spacer(),
                      Text(
                        'John',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      const Text(
                        'Amount',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '₦ ${tm.amount}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      const Text(
                        'Transaction date',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        DateFormat.yMMMEd().format(tm.entryDate),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: const [
                      Text(
                        'Reference',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      Spacer(),
                      Text(
                        '0001111AXDRfrqy',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      const Text(
                        'Status',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                            ),
                            height: 8,
                            width: 8,
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            'Successful',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
