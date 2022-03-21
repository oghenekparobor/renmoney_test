import 'package:demo_2/data/datasource/remote.dart';
import 'package:demo_2/data/repository/repo_impl.dart';
import 'package:demo_2/domain/repository/repo.dart';
import 'package:demo_2/domain/usecase/get_transaction.dart';
import 'package:demo_2/presentation/change-notifier/demo_notifier.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'core/network/network_info.dart';

GetIt getIt = GetIt.instance;

Future<void> setup() async {
  //! External
  //? Dio
  var options = BaseOptions(
    connectTimeout: 5000,
    receiveTimeout: 3000,
    baseUrl:
        'https://api-sandbox.renmoney.com/deposit-transfer/api/v3/investment/3580016662',
  );
  Dio dio = Dio(options);
  getIt.registerLazySingleton<Dio>(() => dio);

  //! Core
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());

  getIt.registerFactory(() => DemoNotifier(getTransactionsUsecase: getIt()));
  getIt.registerLazySingleton(() => GetTransactionsUsecase(repo: getIt()));
  getIt.registerLazySingleton<DemoRepo>(
      () => DemoRepoImpl(networkInfo: getIt(), remoteDatasource: getIt()));
  getIt.registerLazySingleton<RemoteDatasource>(
      () => RemoteDatasourceImpl(dio: getIt()));
}
