import 'package:flutter/material.dart';

class CustomTextInput extends StatelessWidget {
  const CustomTextInput(
      {super.key,
      this.controller,
      this.focusNode,
      this.readOnly = false,
      this.labelText,
      this.minLines,
      this.maxLines});
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool? readOnly;
  final String? labelText;
  final int? minLines;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly ?? false,
      controller: controller,
      focusNode: focusNode,
      minLines: minLines,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
