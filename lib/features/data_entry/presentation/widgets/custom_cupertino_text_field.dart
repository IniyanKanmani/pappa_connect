import 'package:flutter/cupertino.dart';
import 'package:pappa_connect/core/constants/constants.dart';

class CustomCupertinoTextField extends StatelessWidget {
  const CustomCupertinoTextField({
    super.key,
    required this.placeholder,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.minLines,
    this.maxLines,
    required this.onSubmitted,
  });

  final String placeholder;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final int? minLines;
  final int? maxLines;
  final Function(String) onSubmitted;

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      placeholder: placeholder,
      controller: controller,
      placeholderStyle: kHintTextStyle,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      minLines: minLines,
      maxLines: maxLines,
      style: kLabelTextStyle,
      onTapOutside: (_) {
        onSubmitted(controller.text);
      },
      onSubmitted: (_) {
        onSubmitted(controller.text);
      },
    );
  }
}
