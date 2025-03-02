import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dev_test/core/utils/global_instances.dart';
import 'package:flutter_dev_test/core/widgets/alerts/custom_snack_bar.dart';
import 'package:flutter_dev_test/core/widgets/base_screen.dart';
import 'package:flutter_dev_test/core/widgets/buttons/custom_button.dart';
import 'package:flutter_dev_test/core/widgets/textfields/otp_textfield.dart';
import 'package:flutter_dev_test/screens/auth/recovery_secret/controller/cubit/recovery_secret_cubit.dart';
import 'package:flutter_dev_test/screens/auth/recovery_secret/view/widgets/didnt_receive_button.dart';
import 'package:flutter_dev_test/theme/custom_colors.dart';
import 'package:flutter_dev_test/theme/texts.dart';

class RecoverySecretScreen extends StatelessWidget {
  const RecoverySecretScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: BlocConsumer(
        bloc: recoverySecretCubit,
        listener: (context, RecoverySecretState state) {
          if (state.error.isNotEmpty) {
            showCustomSnackbar(context, state.error);
          }
          if (state.message.isNotEmpty) {
            showCustomSnackbar(context, state.message);
          }
        },
        builder: (context, RecoverySecretState state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Text(
                  'Verificação',
                  style: titleText20.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Insira o código que foi enviado:',
                  style: titleText14.copyWith(
                    color: CustomColors.secondary,
                  ),
                ),
                const SizedBox(height: 72),
                OtpTextfield(onChanged: recoverySecretCubit.updateCode),
                const SizedBox(height: 32),
                CustomButton(
                  onPressed: recoverySecretCubit.recoverSecret,
                  loading: state.loading,
                  title: 'Confirmar',
                ),
                const SizedBox(height: 40),
                const DidntReceiveButton(),
              ],
            ),
          );
        },
      ),
    );
  }
}
