class LoginModel {
  final String email;
  final String password;
  final String totpCode;

  LoginModel({
    required this.email,
    required this.password,
    required this.totpCode,
  });

  factory LoginModel.empty() {
    return LoginModel(
      email: '',
      password: '',
      totpCode: '',
    );
  }

  LoginModel copyWith({
    String? email,
    String? password,
    String? totpCode,
  }) {
    return LoginModel(
      email: email ?? this.email,
      password: password ?? this.password,
      totpCode: totpCode ?? this.totpCode,
    );
  }
}
