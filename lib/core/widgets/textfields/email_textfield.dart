import 'package:flutter/material.dart';
import 'package:flutter_dev_test/core/utils/validators.dart';
import 'package:flutter_dev_test/core/widgets/textfields/textfield_custom.dart';

class EmailTextField extends TextFieldCustom {
  const EmailTextField({
    super.key,
    required super.onChanged,
    super.errorMessage,
    super.isEnabled,
    super.controller,
    super.initialValue,
    super.textInputAction,
  }) : super(
          hintText: 'Email',
          keyboardType: TextInputType.emailAddress,
          validator: validateEmail,
        );
}
