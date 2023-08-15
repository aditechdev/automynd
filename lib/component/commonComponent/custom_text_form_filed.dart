import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? textEditingController;
  final String label;
  final String hint;
  final Widget prefixIcon;
  final bool obscureText;
  final Widget? suffixIcon;
  const CustomTextFormField(
      {super.key,
      this.textEditingController,
      required this.label,
      required this.hint,
      required this.prefixIcon,
      this.obscureText = false,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      obscureText: obscureText,
      decoration: InputDecoration(
          // border: Bor,
          labelText: label,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintText: hint,
          border: const OutlineInputBorder()),
    );
  }
}
