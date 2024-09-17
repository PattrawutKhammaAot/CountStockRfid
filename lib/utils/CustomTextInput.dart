import 'package:flutter/material.dart';

class CustomTextInput extends StatelessWidget {
  const CustomTextInput(
      {super.key,
      this.controller,
      this.focusNode,
      this.readOnly = false,
      this.labelText,
      this.minLines,
      this.maxLines,
      this.onChanged,
      this.prefixIcon});
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool? readOnly;
  final String? labelText;
  final int? minLines;
  final int? maxLines;
  final Function(String)? onChanged;
  final Widget? prefixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly ?? false,
      controller: controller,
      focusNode: focusNode,
      minLines: minLines,
      maxLines: maxLines,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        prefixIcon: prefixIcon,
      ),
    );
  }
}
