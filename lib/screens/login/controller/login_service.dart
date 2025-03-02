import 'package:dartz/dartz.dart';
import 'package:flutter_dev_test/core/api/api_client.dart';
import 'package:flutter_dev_test/core/api/base_service.dart';
import 'package:flutter_dev_test/screens/login/controller/login_repository.dart';

class LoginService extends BaseService {
  final loginRepository = LoginRepository();

  LoginService();

  Future<Either<String, ApiResponse>> login(
    String username,
    String password,
    String secret,
  ) {
    return call(() => loginRepository.login(username, password, secret));
  }

  Future<Either<String, String?>> getSecret() {
    return call(loginRepository.getSecret);
  }
}
