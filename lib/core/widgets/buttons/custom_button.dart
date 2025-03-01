import 'package:flutter/material.dart';
import 'package:flutter_dev_test/theme/custom_colors.dart';

enum ButtonType { primary }

class CustomButton extends StatefulWidget {
  final Function()? onPressed;
  final String title;
  final EdgeInsetsGeometry? padding;
  final ButtonType type;
  final bool? loading;

  const CustomButton({
    super.key,
    this.onPressed,
    required this.title,
    this.padding = const EdgeInsets.symmetric(vertical: 20),
    this.type = ButtonType.primary,
    this.loading,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  WidgetStatesController statesController = WidgetStatesController();

  @override
  void initState() {
    statesController.addListener(() {
      Future.delayed(Duration.zero, () {
        setState(() {});
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.loading == true ? null : widget.onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith(_getBackgroundColor),
        padding: WidgetStateProperty.all(widget.padding),
        shape: WidgetStateProperty.all(getButtonShape()),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          widget.loading == true
              ? const SizedBox(
                  height: 19,
                  width: 19,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                )
              : Text(
                  widget.title,
                  style: getTextStyle(),
                ),
        ],
      ),
    );
  }

  Color _getBackgroundColor(Set<WidgetState> states) {
    if (states.contains(WidgetState.disabled)) {
      return CustomColors.brown400.withOpacity(0.5);
    }
    return CustomColors.brown400;
  }

  TextStyle getTextStyle() {
    return TextStyle(
      color: widget.type == ButtonType.primary
          ? CustomColors.white400
          : CustomColors.brown400,
      fontWeight: FontWeight.w500,
    );
  }

  RoundedRectangleBorder getButtonShape() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    );
  }
}
