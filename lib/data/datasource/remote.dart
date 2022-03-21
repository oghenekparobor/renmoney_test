import 'package:demo_2/core/constants/constants.dart';
import 'package:dio/dio.dart';

abstract class RemoteDatasource {
  Future<Map> getTransactions();
}

class RemoteDatasourceImpl extends RemoteDatasource {
  RemoteDatasourceImpl({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<Map> getTransactions() async {
    var response = await dio.get(
      '/transactions',
      options: Options(headers: {
        'Authorization': 'Bearer $token',
        'Sourceappid': appId,
      }),
    );

    return response.data;
  }
}
