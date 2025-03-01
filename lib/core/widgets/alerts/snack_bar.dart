import 'package:flutter/material.dart';
import 'package:flutter_dev_test/theme/custom_colors.dart';
import 'package:flutter_dev_test/theme/texts.dart';

void showCustomSnackbar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(CustomSnackBar(message: message));
}

void showErrorSnackbar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(CustomSnackBar(
    message: message,
    isError: true,
  ));
}

class CustomSnackBar extends SnackBar {
  final String message;
  final bool isError;
  CustomSnackBar({
    required this.message,
    this.isError = false,
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
          backgroundColor: isError ? CustomColors.red400 : CustomColors.dark400,
          elevation: 6,
          duration: const Duration(seconds: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          width: 347,
        );
}
