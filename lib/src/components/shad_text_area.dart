import 'package:flutter/material.dart';
import 'package:shadart/src/components/shad_textfield.dart';

class ShadTextArea extends StatelessWidget {
  const ShadTextArea({
    super.key,
    this.controller,
    this.label,
    this.hintText,
    this.onChanged,
    this.maxLines = 4,
  });
  final TextEditingController? controller;
  final String? label;
  final String? hintText;
  final ValueChanged<String>? onChanged;
  final int maxLines;

  @override
  Widget build(BuildContext context) => ShadTextField(
    controller: controller,
    label: label,
    hintText: hintText,
    onChanged: onChanged,
    maxLines: maxLines,
    keyboardType: TextInputType.multiline,
  );
}
