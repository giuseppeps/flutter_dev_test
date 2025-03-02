import 'package:flutter_dev_test/core/api/api_client.dart';
import 'package:flutter_dev_test/core/api/api_response_service.dart';
import 'package:flutter_dev_test/core/storage/storage.dart';
import 'package:flutter_dev_test/screens/home/controller/cubit/home_cubit.dart';
import 'package:flutter_dev_test/screens/login/controller/cubit/login_cubit.dart';
import 'package:flutter_dev_test/screens/recovery_secret/controller/cubit/recovery_secret_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void init() {
  // Global
  getIt.registerSingleton(ApiClient());
  getIt.registerSingleton(Storage());

  // Services
  getIt.registerLazySingleton(() => ApiResponseService());

  // Cubit
  getIt.registerSingleton(HomeCubit());
  getIt.registerSingleton(LoginCubit());
  getIt.registerSingleton(RecoverySecretCubit());
}
