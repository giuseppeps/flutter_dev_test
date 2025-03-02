import 'package:flutter_dev_test/core/utils/app_texts.dart';
import 'package:flutter_dev_test/core/utils/global_instances.dart';

class RecoverySecretRepository {
  Future<bool> recoverSecret(
    String username,
    String password,
    String code,
  ) async {
    final response = await apiClient.post(
      path: AppTexts.recoverySecret,
      body: {
        'username': username,
        'password': password,
        'code': code,
      },
    );

    storage.set(AppTexts.secret, data: response.data["totp_secret"]);

    return true;
  }
}
