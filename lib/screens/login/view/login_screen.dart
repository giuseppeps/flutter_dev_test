import 'package:flutter/material.dart';
import 'package:flutter_dev_test/core/widgets/alerts/snack_bar.dart';
import 'package:flutter_dev_test/core/widgets/base_screen.dart';
import 'package:flutter_dev_test/core/widgets/buttons/custom_button.dart';
import 'package:flutter_dev_test/core/widgets/textfields/email_textfield.dart';
import 'package:flutter_dev_test/core/widgets/textfields/password_textfield.dart';
import 'package:flutter_dev_test/routes/app_routes.dart';
import 'package:flutter_dev_test/routes/routes.dart';
import 'package:flutter_dev_test/screens/login/view/widgets/logo_image.dart';
import 'package:flutter_dev_test/theme/custom_colors.dart';
import 'package:flutter_dev_test/theme/texts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 72),
          const LogoImage(),
          const SizedBox(height: 38),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                EmailTextField(onChanged: (_) {}),
                const SizedBox(height: 10),
                PasswordTextfield(onChanged: (_) {}),
                const SizedBox(height: 20),
                CustomButton(
                  // onPressed: () => router.push(Routes.recoverySecret),
                  onPressed: () => router.go(Routes.home),
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
      ),
    );
  }
}
