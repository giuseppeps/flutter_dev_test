import 'package:bloc/bloc.dart';
import 'package:flutter_dev_test/core/state/base_state.dart';
import 'package:flutter_dev_test/routes/app_routes.dart';
import 'package:flutter_dev_test/routes/routes.dart';
import 'package:flutter_dev_test/screens/login/model/email_password_model.dart';
import 'package:flutter_dev_test/screens/recovery_secret/controller/recovery_secret_service.dart';

part 'recovery_secret_state.dart';

class RecoverySecretCubit extends Cubit<RecoverySecretState> {
  RecoverySecretCubit() : super(RecoverySecretState.empty());

  Future<void> recoverSecret() async {
    emit(state.copyWith(loading: true));

    final result = await RecoverySecretService().recoverSecret(
      state.model.email,
      state.model.password,
      state.model.totpCode,
    );

    result.fold(
      (l) => emit(state.copyWith(loading: false, error: l)),
      (r) {
        if (r) {
          emit(state.copyWith(
            loading: false,
            message: 'Código recuperado com sucesso',
          ));
          router.go(Routes.login);
        } else {
          emit(state.copyWith(loading: false, error: "Código inválido"));
        }
      },
    );
    Future.delayed(const Duration(seconds: 1), () {
      emit(state.copyWith(message: '', error: ''));
    });
  }

  void updateModel(LoginModel model) {
    emit(state.copyWith(model: model));
  }

  void updateCode(String code) {
    emit(state.copyWith(model: state.model.copyWith(totpCode: code)));
  }
}
