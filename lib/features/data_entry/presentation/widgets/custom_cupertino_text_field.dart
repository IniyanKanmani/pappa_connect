import 'package:flutter/cupertino.dart';
import 'package:pappa_connect/core/constants/constants.dart';

class CustomCupertinoTextField extends StatelessWidget {
  const CustomCupertinoTextField({
    super.key,
    required this.placeholder,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.textCapitalization = TextCapitalization.words,
    this.minLines,
    this.maxLines,
    required this.onChanged,
  });

  final String placeholder;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;
  final int? minLines;
  final int? maxLines;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      placeholder: placeholder,
      controller: controller,
      placeholderStyle: kHintTextStyle,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      textCapitalization: textCapitalization,
      minLines: minLines,
      maxLines: maxLines,
      style: kLabelTextStyle,
      onChanged: (_) {
        onChanged(controller.text);
      },
    );
  }
}
