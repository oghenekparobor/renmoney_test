import 'package:demo_2/presentation/change-notifier/demo_notifier.dart';
import 'package:demo_2/presentation/widgets/tran_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListPage extends StatelessWidget {
  static const route = '/list_page';
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: FutureBuilder(
          future: Provider.of<DemoNotifier>(
            context,
            listen: false,
          ).getTranasctions(),
          builder: (_, s) {
            if (s.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Consumer<DemoNotifier>(
                builder: (context, value, child) => ListView(
                  children: [
                    const Text(
                      'All Transaction',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                    const SizedBox(height: 15),
                    for (var i = 0; i < value.transactions.length; i++)
                      TransactionTile(tm: value.transactions[i])
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
