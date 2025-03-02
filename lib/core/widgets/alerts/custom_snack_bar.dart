import 'package:flutter/material.dart';
import 'package:flutter_dev_test/theme/custom_colors.dart';
import 'package:flutter_dev_test/theme/texts.dart';

void showCustomSnackbar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(CustomSnackBar(message: message));
}

class CustomSnackBar extends SnackBar {
  final String message;
  CustomSnackBar({
    required this.message,
    super.key,
  }) : super(
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                child: Text(
                  message,
                  style: titleText12.copyWith(
                    color: CustomColors.white400,
                  ),
                ),
              ),
            ],
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: CustomColors.primary,
          elevation: 6,
          duration: const Duration(seconds: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          width: 347,
        );
}
