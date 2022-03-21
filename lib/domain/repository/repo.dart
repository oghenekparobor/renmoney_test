import 'package:dartz/dartz.dart';
import 'package:demo_2/core/failure/failure.dart';
import 'package:demo_2/data/model/transaction.dart';

abstract class DemoRepo {
  Future<Either<Failure, List<TransactionModel>>> getTransaction();
}
