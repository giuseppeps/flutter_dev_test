part of 'login_cubit.dart';

class LoginState extends BaseState {
  final LoginModel model;

  LoginState({
    required super.loading,
    required super.error,
    required super.message,
    required this.model,
  });

  factory LoginState.empty() {
    return LoginState(
      loading: false,
      error: '',
      message: '',
      model: LoginModel.empty(),
    );
  }

  @override
  LoginState copyWith({
    bool? loading,
    String? error,
    String? message,
    LoginModel? model,
  }) {
    return LoginState(
      loading: loading ?? this.loading,
      error: error ?? this.error,
      message: message ?? this.message,
      model: model ?? this.model,
    );
  }
}
