import 'package:bloc/bloc.dart';
import 'package:flutter_dev_test/core/state/base_state.dart';
import 'package:flutter_dev_test/core/utils/global_instances.dart';
import 'package:flutter_dev_test/routes/app_routes.dart';
import 'package:flutter_dev_test/routes/routes.dart';
import 'package:flutter_dev_test/screens/login/controller/login_service.dart';
import 'package:flutter_dev_test/screens/login/model/email_password_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState.empty());

  Future<void> login() async {
    emit(state.copyWith(loading: true));

    final hasSecret = await _checkAndSetSecret();
    if (!hasSecret) return;

    await _performLogin();
  }

  Future<bool> _checkAndSetSecret() async {
    final totpCode = await LoginService().getSecret();

    return totpCode.fold(
      (l) {
        emit(state.copyWith(loading: false, error: l));
        return false;
      },
      (r) {
        if (r == null) {
          emit(state.copyWith(loading: false));
          recoverySecretCubit.updateModel(state.model);
          router.push(Routes.recoverySecret);
          return false;
        }
        emit(state.copyWith(
          loading: false,
          model: state.model.copyWith(totpCode: r),
        ));
        return true;
      },
    );
  }

  Future<void> _performLogin() async {
    final result = await LoginService().login(
      state.model.email,
      state.model.password,
      state.model.totpCode,
    );

    result.fold(
      (l) => emit(state.copyWith(loading: false, error: l)),
      (r) {
        emit(state.copyWith(
          loading: false,
          model: LoginModel.empty(),
        ));
        router.go(Routes.home);
      },
    );

    Future.delayed(const Duration(seconds: 1), () {
      emit(state.copyWith(message: '', error: ''));
    });
  }

  void onChangeEmail(String email) {
    emit(state.copyWith(model: state.model.copyWith(email: email)));
  }

  void onChangePassword(String password) {
    emit(state.copyWith(model: state.model.copyWith(password: password)));
  }
}
