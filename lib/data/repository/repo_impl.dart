import 'package:demo_2/core/network/network_info.dart';
import 'package:demo_2/data/datasource/remote.dart';
import 'package:demo_2/data/model/transaction.dart';
import 'package:demo_2/core/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:demo_2/domain/repository/repo.dart';
import 'package:dio/dio.dart';

class DemoRepoImpl implements DemoRepo {
  DemoRepoImpl({
    required this.networkInfo,
    required this.remoteDatasource,
  });

  final NetworkInfo networkInfo;
  final RemoteDatasource remoteDatasource;

  @override
  Future<Either<Failure, List<TransactionModel>>> getTransaction() async {
    if (await networkInfo.isConnected()) {
      try {
        var _data = <TransactionModel>[];

        var data = await remoteDatasource.getTransactions();

        for (var element in (data['data']['clientTransactions'] as List)) {
          _data.add(TransactionModel.fromJson(element));
        }

        return Right(_data);
      } on DioError catch (e) {
        if (e.type == DioErrorType.receiveTimeout) return Left(TimeOutError());
        if (e.type == DioErrorType.connectTimeout) return Left(TimeOutError());
        return Left(SomethingWentWrong());
      } catch (e) {
        print(e);
        return Left(UnexpectedError());
      }
    } else {
      return Left(ServerException());
    }
  }
}
