import 'package:flutter_dev_test/core/api/api_client.dart';
import 'package:flutter_dev_test/core/api/api_response_service.dart';
import 'package:flutter_dev_test/core/storage/storage.dart';
import 'package:flutter_dev_test/injection.dart';
import 'package:flutter_dev_test/screens/home/controller/cubit/home_cubit.dart';
import 'package:flutter_dev_test/screens/login/controller/cubit/login_cubit.dart';
import 'package:flutter_dev_test/screens/recovery_secret/controller/cubit/recovery_secret_cubit.dart';

//Global
final apiClient = getIt<ApiClient>();
final storage = getIt<Storage>();

//Services
final apiResponseService = getIt<ApiResponseService>();

//Cubits
final homeCubit = getIt<HomeCubit>();
final loginCubit = getIt<LoginCubit>();
final recoverySecretCubit = getIt<RecoverySecretCubit>();
