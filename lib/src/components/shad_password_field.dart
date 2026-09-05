import 'package:flutter/material.dart';
import 'package:shadart/src/components/shad_textfield.dart';

class ShadPasswordField extends StatelessWidget {
  const ShadPasswordField({
    super.key,
    this.controller,
    this.label,
    this.hintText,
    this.onChanged,
  });
  final TextEditingController? controller;
  final String? label;
  final String? hintText;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) => ShadTextField(
    controller: controller,
    label: label,
    hintText: hintText,
    onChanged: onChanged,
    obscureText: true,
  );
}
