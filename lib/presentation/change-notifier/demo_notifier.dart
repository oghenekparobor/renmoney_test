import 'package:bot_toast/bot_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:demo_2/core/failure/failure.dart';
import 'package:demo_2/core/usecases/usecases.dart';
import 'package:demo_2/data/model/transaction.dart';
import 'package:demo_2/domain/usecase/get_transaction.dart';
import 'package:flutter/material.dart';

class DemoNotifier with ChangeNotifier {
  DemoNotifier({
    required this.getTransactionsUsecase,
  });

  final GetTransactionsUsecase getTransactionsUsecase;

  var _transactions = <TransactionModel>[];

  List<TransactionModel> get transactions => _transactions;

  Future<void> getTranasctions() async {
    var data = await getTransactionsUsecase.call(const NoParams());

    return data.fold(
        (l) => Left(BotToast.showSimpleNotification(
            title: 'Oops!',
            subTitle: FailureToString.mapFailureToMessage(l))), (r) {
      _transactions = r;

      notifyListeners();
    });
  }
}
