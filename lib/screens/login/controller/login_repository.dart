import 'package:flutter_dev_test/core/api/api_client.dart';
import 'package:flutter_dev_test/core/utils/app_texts.dart';
import 'package:flutter_dev_test/core/utils/global_instances.dart';
import 'package:otp/otp.dart';

class LoginRepository {
  LoginRepository();

  Future<ApiResponse> login(
    String username,
    String password,
    String secret,
  ) async {
    final totpCode = generateTOTP(secret);
    final response = await apiClient.post(
      path: AppTexts.login,
      body: {
        'username': username,
        'password': password,
        'totp_code': totpCode,
      },
    );
    return response;
  }

  Future<String?> getSecret() async {
    final secret = await storage.get(AppTexts.secret);

    if (secret == null) return null;
    return secret;
  }

  String generateTOTP(String secret) {
    return OTP.generateTOTPCodeString(
      secret,
      DateTime.now().millisecondsSinceEpoch,
      interval: 30,
      algorithm: Algorithm.SHA1,
      isGoogle: true,
    );
  }
}
