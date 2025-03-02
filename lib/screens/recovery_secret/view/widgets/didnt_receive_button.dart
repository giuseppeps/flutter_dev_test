import 'package:flutter/material.dart';
import 'package:flutter_dev_test/core/utils/image_path.dart';
import 'package:flutter_dev_test/core/widgets/alerts/custom_snack_bar.dart';
import 'package:flutter_dev_test/theme/custom_colors.dart';
import 'package:flutter_dev_test/theme/texts.dart';
import 'package:flutter_svg/svg.dart';

class DidntReceiveButton extends StatelessWidget {
  const DidntReceiveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}
