import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dev_test/core/utils/global_instances.dart';
import 'package:flutter_dev_test/core/widgets/alerts/custom_snack_bar.dart';
import 'package:flutter_dev_test/core/widgets/base_screen.dart';
import 'package:flutter_dev_test/core/widgets/buttons/custom_button.dart';
import 'package:flutter_dev_test/core/widgets/textfields/email_textfield.dart';
import 'package:flutter_dev_test/core/widgets/textfields/password_textfield.dart';
import 'package:flutter_dev_test/screens/auth/login/controller/cubit/login_cubit.dart';
import 'package:flutter_dev_test/screens/auth/login/view/widgets/logo_image.dart';
import 'package:flutter_dev_test/theme/custom_colors.dart';
import 'package:flutter_dev_test/theme/texts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: BlocConsumer(
        bloc: loginCubit,
        listener: (context, LoginState state) {
          if (state.error.isNotEmpty) {
            showCustomSnackbar(context, state.error);
          }
        },
        builder: (context, LoginState state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 72),
              const LogoImage(),
              const SizedBox(height: 38),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    EmailTextField(onChanged: loginCubit.onChangeEmail),
                    const SizedBox(height: 10),
                    PasswordTextfield(
                      onChanged: loginCubit.onChangePassword,
                      onSubmit: (_) => loginCubit.login(),
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      onPressed: loginCubit.login,
                      loading: state.loading,
                      title: 'Entrar',
                    )
                  ],
                ),
              ),
              const SizedBox(height: 209),
              Center(
                child: InkWell(
                  onTap: () => showCustomSnackbar(context, 'Em breve'),
                  child: Text(
                    'Esqueci a senha',
                    style: titleText12.copyWith(
                      color: CustomColors.brown400,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 38),
            ],
          );
        },
      ),
    );
  }
}
