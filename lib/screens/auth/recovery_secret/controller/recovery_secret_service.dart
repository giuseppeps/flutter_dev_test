import 'package:dartz/dartz.dart';
import 'package:flutter_dev_test/core/api/base_service.dart';
import 'package:flutter_dev_test/screens/auth/recovery_secret/controller/recovery_secret_repository.dart';

class RecoverySecretService extends BaseService {
  final recoverySecretRepository = RecoverySecretRepository();

  Future<Either<String, bool>> recoverSecret(
    String username,
    String password,
    String code,
  ) {
    return call(
      () => recoverySecretRepository.recoverSecret(
        username,
        password,
        code,
      ),
    );
  }
}
