part of 'recovery_secret_cubit.dart';

class RecoverySecretState extends BaseState {
  final LoginModel model;

  RecoverySecretState({
    required super.loading,
    required super.error,
    required super.message,
    required this.model,
  });

  @override
  RecoverySecretState copyWith({
    bool? loading,
    String? error,
    String? message,
    LoginModel? model,
  }) {
    return RecoverySecretState(
      loading: loading ?? this.loading,
      error: error ?? this.error,
      message: message ?? this.message,
      model: model ?? this.model,
    );
  }

  factory RecoverySecretState.empty() {
    return RecoverySecretState(
      loading: false,
      error: '',
      message: '',
      model: LoginModel.empty(),
    );
  }
}
