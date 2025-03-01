import 'package:flutter_dev_test/core/api/api_response_service.dart';
import 'package:flutter_dev_test/injection.dart';
import 'package:flutter_dev_test/screens/home/controller/cubit/home_cubit.dart';

final homeCubit = getIt<HomeCubit>();
final apiResponseService = getIt<ApiResponseService>();
