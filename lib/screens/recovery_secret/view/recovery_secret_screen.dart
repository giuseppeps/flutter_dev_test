import 'package:flutter/material.dart';
import 'package:flutter_dev_test/core/utils/image_path.dart';
import 'package:flutter_dev_test/core/widgets/alerts/snack_bar.dart';
import 'package:flutter_dev_test/core/widgets/base_screen.dart';
import 'package:flutter_dev_test/core/widgets/buttons/custom_button.dart';
import 'package:flutter_dev_test/core/widgets/textfields/otp_textfield.dart';
import 'package:flutter_dev_test/theme/custom_colors.dart';
import 'package:flutter_dev_test/theme/texts.dart';
import 'package:flutter_svg/svg.dart';

class RecoverySecretScreen extends StatelessWidget {
  const RecoverySecretScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Padding(
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
            const OtpTextfield(),
            const SizedBox(height: 32),
            const CustomButton(title: 'Confirmar'),
            const SizedBox(height: 40),
            Center(
              child: InkWell(
                onTap: () => showCustomSnackbar(context, 'Em breve'),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(ImagePath.messageQuestion),
                    const SizedBox(width: 8),
                    Text(
                      'Não recebi o código',
                      style: titleText12.copyWith(
                        fontWeight: FontWeight.w600,
                        color: CustomColors.textOnBackground,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
