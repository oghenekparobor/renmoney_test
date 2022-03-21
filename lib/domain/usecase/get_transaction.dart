import 'package:dartz/dartz.dart';
import 'package:demo_2/core/usecases/usecases.dart';
import 'package:demo_2/domain/repository/repo.dart';

import '../../core/failure/failure.dart';
import '../../data/model/transaction.dart';

class GetTransactionsUsecase extends Usecase<void, NoParams> {
  GetTransactionsUsecase({
    required this.repo,
  });

  final DemoRepo repo;

  @override
  Future<Either<Failure, List<TransactionModel>>> call(NoParams params) async =>
      await repo.getTransaction();
}
