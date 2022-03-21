import 'package:flutter/material.dart';

import 'list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        elevation: 0,
      ),
      body: Center(
        child: MaterialButton(
          onPressed: () => Navigator.of(context).pushNamed(ListPage.route),
          child: const Text(
            'Transactions',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          color: Theme.of(context).primaryColor,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        ),
      ),
    );
  }
}
