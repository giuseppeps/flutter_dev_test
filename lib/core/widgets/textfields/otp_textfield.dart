import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dev_test/theme/custom_colors.dart';
import 'package:flutter_dev_test/theme/texts.dart';

class OtpTextfield extends StatefulWidget {
  final Function(String)? onChanged;
  final Function(String)? onSubmit;

  const OtpTextfield({super.key, this.onChanged, this.onSubmit});

  @override
  State<OtpTextfield> createState() => _OtpTextfieldState();
}

class _OtpTextfieldState extends State<OtpTextfield> {
  final List<TextEditingController> _controllers =
      List.generate(6, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());

  void _onTextChanged(int index, String value) {
    if (value.isNotEmpty && index < 5) {
      _focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }

    final code = _controllers.map((c) => c.text).join();
    widget.onChanged?.call(code);
    if (code.length == 6) {
      widget.onSubmit?.call(code);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(6, (index) {
        return Container(
          width: 54,
          height: 52,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          child: Focus(
            onFocusChange: (isFocused) {
              setState(() {});
            },
            child: TextField(
              controller: _controllers[index],
              focusNode: _focusNodes[index],
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              maxLength: 1,
              cursorWidth: 1.5,
              cursorHeight: 16,
              cursorColor: CustomColors.brown400,
              style: titleText16.copyWith(
                fontWeight: FontWeight.w600,
                color: CustomColors.brown400,
              ),
              decoration: InputDecoration(
                counterText: "",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide:
                      const BorderSide(color: CustomColors.lightBackground500),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(
                    color: CustomColors.brown400,
                    width: 1.5,
                  ),
                ),
                filled: true,
                fillColor: _focusNodes[index].hasFocus
                    ? CustomColors.white400
                    : CustomColors.lightBackground600,
              ),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(1),
              ],
              onChanged: (value) => _onTextChanged(index, value),
            ),
          ),
        );
      }),
    );
  }
}
