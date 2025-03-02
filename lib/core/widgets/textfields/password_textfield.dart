import 'package:flutter/material.dart';
import 'package:flutter_dev_test/core/utils/validators.dart';
import 'package:flutter_dev_test/core/widgets/textfields/textfield_custom.dart';

class PasswordTextfield extends TextFieldCustom {
  const PasswordTextfield({
    super.key,
    required super.onChanged,
    super.onSubmit,
    super.errorMessage,
    super.isEnabled,
    super.controller,
    super.initialValue,
    super.textInputAction,
  }) : super(
          hintText: 'Senha',
          keyboardType: TextInputType.text,
          isPassword: true,
          validator: validatePassword,
        );
}
