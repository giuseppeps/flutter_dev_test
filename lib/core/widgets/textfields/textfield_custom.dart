import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dev_test/theme/custom_colors.dart';
import 'package:flutter_dev_test/theme/texts.dart';

class TextFieldCustom extends StatelessWidget {
  final String? errorMessage;
  final String? hintText;
  final bool isPassword;
  final bool isEnabled;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final String? initialValue;
  final TextEditingController? controller;
  final int? maxLines;
  final Function(String)? onFieldSubmitted;

  const TextFieldCustom({
    super.key,
    this.errorMessage,
    this.hintText,
    this.isPassword = false,
    this.isEnabled = true,
    this.validator,
    this.onChanged,
    this.keyboardType,
    this.inputFormatters,
    this.textInputAction,
    this.initialValue,
    this.controller,
    this.maxLines = 1,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: CustomColors.lightBackground,
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextFormField(
            obscureText: isPassword,
            controller: controller,
            enabled: isEnabled,
            validator: validator,
            maxLines: maxLines,
            initialValue: initialValue,
            onChanged: onChanged,
            onFieldSubmitted: onFieldSubmitted,
            keyboardType: keyboardType,
            inputFormatters: inputFormatters,
            textInputAction: textInputAction,
            style: titleText12.copyWith(
              color: CustomColors.textOnBackground,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: titleText12.copyWith(
                color: CustomColors.textOnBackground,
              ),
            ),
          ),
        ),
        if (errorMessage != null)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              errorMessage!,
              style: titleText12.copyWith(color: CustomColors.red400),
            ),
          ),
      ],
    );
  }
}
