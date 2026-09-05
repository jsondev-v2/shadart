import 'package:flutter/material.dart';

import '../theme/shad_theme.dart';

class ShadTextField extends StatelessWidget {
  const ShadTextField({
    super.key,
    this.controller,
    this.label,
    this.hintText,
    this.helperText,
    this.errorText,
    this.prefix,
    this.suffix,
    this.obscureText = false,
    this.enabled = true,
    this.maxLines = 1,
    this.minLines,
    this.onChanged,
    this.onSubmitted,
    this.keyboardType,
    this.textInputAction,
  });
  final TextEditingController? controller;
  final String? label;
  final String? hintText;
  final String? helperText;
  final String? errorText;
  final Widget? prefix;
  final Widget? suffix;
  final bool obscureText;
  final bool enabled;
  final int? maxLines;
  final int? minLines;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    final colors = context.shadColors;
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: colors.border),
    );
    return TextField(
      controller: controller,
      obscureText: obscureText,
      enabled: enabled,
      maxLines: obscureText ? 1 : maxLines,
      minLines: minLines,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      style: TextStyle(color: colors.foreground, fontSize: 14),
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        prefixIcon: prefix,
        suffixIcon: suffix,
        isDense: true,
        filled: true,
        fillColor: colors.background,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 13,
        ),
        hintStyle: TextStyle(color: colors.mutedForeground),
        labelStyle: TextStyle(color: colors.mutedForeground),
        border: border,
        enabledBorder: border,
        focusedBorder: border.copyWith(
          borderSide: BorderSide(color: colors.foreground, width: 1.5),
        ),
        errorBorder: border.copyWith(
          borderSide: BorderSide(color: colors.destructive),
        ),
        focusedErrorBorder: border.copyWith(
          borderSide: BorderSide(color: colors.destructive, width: 1.5),
        ),
        errorText: errorText,
        helperText: helperText,
        helperStyle: TextStyle(color: colors.mutedForeground),
        errorStyle: TextStyle(color: colors.destructive),
      ),
    );
  }
}
