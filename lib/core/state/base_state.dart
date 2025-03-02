class BaseState {
  final bool loading;
  final String error;
  final String message;

  BaseState({
    required this.loading,
    required this.error,
    required this.message,
  });

  BaseState copyWith({
    bool? loading,
    String? error,
    String? message,
  }) {
    return BaseState(
      loading: loading ?? this.loading,
      error: error ?? this.error,
      message: message ?? this.message,
    );
  }
}
