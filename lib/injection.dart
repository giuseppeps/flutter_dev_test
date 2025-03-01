import 'package:flutter_dev_test/core/api/api_client.dart';
import 'package:flutter_dev_test/core/api/api_response_service.dart';
import 'package:flutter_dev_test/screens/home/controller/cubit/home_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void init() {
  // Global
  getIt.registerSingleton(ApiClient);

  // Services
  getIt.registerLazySingleton(() => ApiResponseService());

  // Cubit
  getIt.registerSingleton(HomeCubit);
}
